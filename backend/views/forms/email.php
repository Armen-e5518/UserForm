<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Forms */
$this->registerJsFile('//code.jquery.com/jquery-1.12.4.js', ['position' => \yii\web\View::POS_END]);
$this->title = 'Email text';

?>
<div class="forms-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'email_subject')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'email_text')->textarea(['row' => 3]) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success' ]) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
