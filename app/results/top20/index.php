<?php
    const LOGIN_PAGE_PATH = '../../crud/';
    require_once '../../crud/auth.php';

    require_once '../../config/database.php';
    require_once '../../models/Admin.php';
    require_once '../../models/Team.php';
    require_once '../../models/Event.php';

    // initialize titles
    $competition_title = 'MISS KAOGMA 2023 SCREENING';
    $titles = [];
    for($i=1; $i<=20; $i++) {
        $titles[] = '' . $i;
    }

    // initialize admin
    $admin = new Admin();

    // initialize events
    $event_screening_1 = Event::findBySlug('screening-1');
    $event_screening_2 = Event::findBySlug('screening-2');
    $event_selection   = Event::findBySlug('selection-of-top-20');


    // tabulate events
    $result_screening_1 = $admin->tabulate($event_screening_1);
    $result_screening_2 = $admin->tabulate($event_screening_2);

    // process result
    $result = [];
    $unique_averages = [];
    foreach($event_selection->getAllTeams() as $team) {
        $team_key = 'team_'.$team->getId();

        // get source and average
        $source  = '';
        $average = 0;
        if(isset($result_screening_1['teams'][$team_key])) {
            $source  = '1st Screening';
            $average = $result_screening_1['teams'][$team_key]['ratings']['average'];
        }
        else if(isset($result_screening_2['teams'][$team_key])) {
            $source  = '2nd Screening';
            $average = $result_screening_2['teams'][$team_key]['ratings']['average'];
        }

        // push $average to $unique_averages
        if(!in_array($average, $unique_averages))
            $unique_averages[] = $average;


        // append to $result
        $result[$team_key] = [
            'info'    => $team->toArray(),
            'source'  => $source,
            'average' => $average,
            'rank'    => [
                'dense' => 0,
                'fractional' => 0
            ],
            'title'   => ''
        ];
    }

    // reverse sort $unique_averages
    rsort($unique_averages);

    // gather $rank_group (for getting fractional rank)
    $rank_group = [];
    foreach($result as $team_key => $team) {
        // get dense rank
        $dense_rank = 1 + array_search($team['average'], $unique_averages);
        $result[$team_key]['rank']['dense'] = $dense_rank;

        // push $team_key to $rank_group
        $key_rank = 'rank_' . $dense_rank;
        if(!isset($rank_group[$key_rank]))
            $rank_group[$key_rank] = [];
        $rank_group[$key_rank][] = $team_key;
    }

    // get fractional rank and winners
    $ctr = 0;
    $title_ctr = 0;
    $tops_ordered   = [];
    $tops_unordered = [];
    for($i = 0; $i < sizeof($unique_averages); $i++) {
        $key = 'rank_' . ($i + 1);
        $group = $rank_group[$key];
        $size = sizeof($group);
        $fractional_rank = $ctr + ((($size * ($size + 1)) / 2) / $size);

        // write $fractional_rank to $group members
        for($j = 0; $j < $size; $j++) {
            $result[$group[$j]]['rank']['fractional'] = $fractional_rank;
            if($title_ctr < sizeof($titles)) {
                $result[$group[$j]]['title'] = 'winner';

                $tops_ordered[]   = $result[$group[$j]]['info']['id'];
                $tops_unordered[] = $result[$group[$j]]['info']['id'];
            }
        }

        $ctr += $size;
        $title_ctr += $size;
    }

    // sort $tops_ordered
    sort($tops_ordered);

    // shuffle $tops_unordered (deterministic)
    mt_srand(318579462);
    shuffle($tops_unordered);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../../crud/dist/bootstrap-5.2.3/css/bootstrap.min.css">
    <style>
        th, td {
            vertical-align: middle;
        },
        .bt {
            border-top: 2px solid #aaa !important;
        }
        .br {
            border-right: 2px solid #aaa !important;
        }
        .bb, table.result tbody tr:last-child td {
            border-bottom: 2px solid #aaa !important;
        }
        .bl {
            border-left: 2px solid #aaa !important;
        }
    </style>
    <title>Top 20</title>
</head>
<body>
    <table class="table table-bordered result">
        <thead>
            <tr class="table-secondary">
                <th colspan="3" rowspan="2" class="text-center bt br bl">
                    <h1 class="m-0">TOP <?= sizeof($titles) ?></h1>
                    <h5><?= $competition_title ?></h5>
                </th>
                <th rowspan="2" class="text-center bt br">
                    SOURCE
                </th>
                <th rowspan="2" class="text-center bt br">
                    AVERAGE
                </th>
                <th colspan="2" class="text-center bt br">
                    RANK
                </th>
            </tr>
            <tr class="table-secondary">
                <th class="text-center">DENSE</th>
                <th class="text-center br">FRACT</th>
            </tr>
        </thead>
        <tbody>
        <?php
        foreach($result as $team_key => $team) { ?>
            <tr<?= $team['title'] !== '' ? ' class="table-warning"' : '' ?>>
                <!-- number -->
                <td class="pe-3 fw-bold bl" align="right">
                    <h4 class="m-0">
                        <?= $team['info']['number'] ?>
                    </h4>
                </td>

                <!-- avatar -->
                <td style="width: 72px;">
                    <img
                        src="../../crud/uploads/<?= $team['info']['avatar'] ?>"
                        alt="<?= $team['info']['number'] ?>"
                        style="width: 100%; border-radius: 100%"
                    >
                </td>

                <!-- name -->
                <td class="br">
                    <h6 class="text-uppercase m-0"><?= $team['info']['name'] ?></h6>
                    <small class="m-0"><?= $team['info']['location'] ?></small>
                </td>

                <!-- source -->
                <td class="br text-center">
                    <?= $team['source'] ?>
                </td>

                <!-- average -->
                <td class="pe-5 br" align="right">
                    <?= number_format($team['average'], 2) ?>
                </td>

                <!-- dense rank -->
                <td class="pe-3" align="right">
                    <?= number_format($team['rank']['dense'], 2) ?>
                </td>

                <!-- fractional rank -->
                <td class="pe-3 br fw-bold opacity-75" align="right">
                    <?= number_format($team['rank']['fractional'], 2) ?>
                </td>
            </tr>
        <?php } ?>
        </tbody>
    </table>

    <!-- Summary -->
    <div class="container-fluid mt-5" style="page-break-before: always;">
        <div class="row">
            <!-- unordered -->
            <div class="col-md-6" align="center">
                <h4 class="opacity-75"><?= $competition_title ?></h4>
                <h1>TOP <?= sizeof($titles) ?> in Random Order</h1>
                <h4>FOR ANNOUNCEMENT</h4>
                <div style="width: 80%;">
                    <table class="table table-bordered mt-3">
                        <tbody>
                        <?php
                        foreach($tops_unordered as $team_id) {
                            $team = $result['team_'.$team_id];
                            ?>
                            <tr>
                                <!-- number -->
                                <td class="pe-3 fw-bold text-center">
                                    <h3 class="m-0">
                                        <?= $team['info']['number'] ?>
                                    </h3>
                                </td>

                                <!-- avatar -->
                                <td style="width: 72px;">
                                    <img
                                        src="../../crud/uploads/<?= $team['info']['avatar'] ?>"
                                        alt="<?= $team['info']['number'] ?>"
                                        style="width: 100%; border-radius: 100%"
                                    >
                                </td>

                                <!-- name -->
                                <td>
                                    <h6 class="text-uppercase m-0"><?= $team['info']['name'] ?></h6>
                                    <small class="m-0"><?= $team['info']['location'] ?></small>
                                </td>
                            </tr>
                        <?php } ?>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- ordered -->
            <div class="col-md-6" align="center">
                <h4 class="opacity-75"><?= $competition_title ?></h4>
                <h1>TOP <?= sizeof($titles) ?> in Proper Order</h1>
                <h4>FOR FINAL Q & A</h4>
                <div style="width: 80%;">
                    <table class="table table-bordered mt-3">
                        <tbody>
                        <?php
                        foreach($tops_ordered as $team_id) {
                            $team = $result['team_'.$team_id];
                            ?>
                            <tr>
                                <!-- number -->
                                <td class="pe-3 fw-bold text-center">
                                    <h3 class="m-0">
                                        <?= $team['info']['number'] ?>
                                    </h3>
                                </td>

                                <!-- avatar -->
                                <td style="width: 72px;">
                                    <img
                                        src="../../crud/uploads/<?= $team['info']['avatar'] ?>"
                                        alt="<?= $team['info']['number'] ?>"
                                        style="width: 100%; border-radius: 100%"
                                    >
                                </td>

                                <!-- name -->
                                <td>
                                    <h6 class="text-uppercase m-0"><?= $team['info']['name'] ?></h6>
                                    <small class="m-0"><?= $team['info']['location'] ?></small>
                                </td>
                            </tr>
                        <?php } ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>