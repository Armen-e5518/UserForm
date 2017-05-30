<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\FormsSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
$this->registerJsFile('//code.jquery.com/jquery-1.12.4.js', ['position' => \yii\web\View::POS_END]);
$this->title = 'Forms';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="forms-index">
    <p>
        <?= Html::a('Create Forms', ['/form'], ['class' => 'btn btn-success']) ?>
    </p>
    <div class="row">
        <div class="col-md-12">
            <?= GridView ::widget([
                'dataProvider' => $dataProvider,
                'filterModel' => $searchModel,
                'columns' => [
                    ['class' => 'yii\grid\SerialColumn'],
                    [
                        'attribute' => 'url',
                        'value' => function($model){
                            return '<a target="_blank" href="'.$model->url.'">'.$model->url.'</a>';
                        },
                        'format' => 'raw'
                    ],
                    'name',
                    [
                        'class' => 'yii\grid\ActionColumn',
                        'header' => 'Actions',
//                        'headerOptions' => ['style' => 'color:#337ab7'],
                        'template' => '{view}{update}{delete}{clone}',
                        'buttons' => [
                            'view' => function ($url, $model) {
                                return Html::a('<span class="glyphicon glyphicon-eye-open"></span>', $url, [
                                    'title' => Yii::t('app', 'lead-view'),
                                ]);
                            },
                            'update' => function ($url, $model) {
                                return Html::a('<span class="glyphicon glyphicon-pencil"></span>', $url, [
                                    'title' => Yii::t('app', 'lead-update'),
                                ]);
                            },
                            'delete' => function ($url, $model) {
                                return Html::a('<span class="glyphicon glyphicon-trash"></span>', $url, [
                                    'title' => Yii::t('app', 'lead-delete'),
                                ]);
                            },
                            'clone' => function ($url, $model) {
                                return Html::a('<span class="glyphicon glyphicon-resize-full"></span>', $url, [
                                    'title' => Yii::t('app', 'clone'),
                                ]);
                            }

                        ],
                        'urlCreator' => function ($action, $model, $key, $index) {
                            if ($action === 'view') {
                                $url ='/admin/form/view?id='.$model->id;
                                return $url;
                            }
                            if ($action === 'update') {
                                $url ='/admin/form/update?id='.$model->id;
                                return $url;
                            }
                            if ($action === 'delete') {
                                $url ='/admin/forms/delete?id='.$model->id;
                                return $url;
                            }
                            if ($action === 'clone') {
                                $url ='/admin/form/clone?id='.$model->id;
                                return $url;
                            }
                        }
                    ],
                ],
            ]); ?>
        </div>
    </div>
</div>
