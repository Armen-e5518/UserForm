<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;




$this->registerCssFile('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css');
$this->registerCssFile('https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.5.1/css/froala_editor.pkgd.min.css');
$this->registerCssFile('https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.5.1/css/froala_style.min.css');

$this->registerJsFile('//code.jquery.com/jquery-1.12.4.js');
//$this->registerJsFile('https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.0/jquery.min.js');
$this->registerJsFile('https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.5.1//js/froala_editor.pkgd.min.js');
$this->registerJsFile('/admin/js/froala.js');


$this->title = 'Thank you';

?>


<div class="forms-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'thank_title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'thank_text')->textarea(['row' => 5]) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
