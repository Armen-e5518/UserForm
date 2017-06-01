<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;


$this->registerJsFile('//code.jquery.com/jquery-1.12.4.js', ['position' => \yii\web\View::POS_END]);
$this->title = 'Thank you';

?>
<div class="forms-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'thank_title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'thank_text')->textarea(['row' => 3]) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success' ]) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
