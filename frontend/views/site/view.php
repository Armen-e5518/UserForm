<?php
use common\widgets\Alert;

echo Alert::widget();
$this->registerCssFile('/css/usembassy/src1.css');
$this->registerCssFile('/css/src.css');
$this->registerCssFile('/css/front.css');
$this->registerJsFile('/lib/jquery/dist/jquery.min.js', ['position' => \yii\web\View::POS_END]);
$this->registerJsFile('/js/src.js', ['position' => \yii\web\View::POS_END]);
$this->registerJsFile('/js/save-form.js', ['position' => \yii\web\View::POS_END]);

?>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<div class="mo-header">
    <div class="container">
        <div class="mo-language">
            <ul class="head-disclaimer">
                <li class="throw-away"> </li>
                <li class="disclaimer">
                    <span>             </span>
                </li>

            </ul>
        </div>
        <div class="mo-header-wrap">
            <div class="mo-logo">
                <a class="brand-logo" href="https://am.usembassy.gov/"><img
                            alt="United States of America, Department of State"
                            src="https://am.usembassy.gov/wp-content/themes/cms3/dist/images/dos-logo-light.png"></a>
                <h1><a class="brand" href="https://am.usembassy.gov/" title="U.S. Embassy in Armenia"><span
                                class="head-title-1 head-one-liner">U.S. Embassy in Armenia</span></a></h1>
            </div>
            <div class="mo-header-social-search">
                <section class="mo-footer-subscription widget text-44 widget_text">
                    <div class="textwidget">
                        <div class="mo-social-links"><a class="fa fa-twitter" href="http://twitter.com/usembarmenia"
                                                        style="color:#ffffff;background:#003875; border:1px solid #003875"
                                                        title="Twitter"><span>Twitter</span></a><a
                                    class="fa fa-facebook" href="https://www.facebook.com/usembarmenia"
                                    style="color:#ffffff;background:#003875; border:1px solid #003875" title="Facebook"><span>Facebook</span></a><a
                                    class="fa fa-youtube" href="http://www.youtube.com/user/usembassyarmenia"
                                    style="color:#ffffff;background:#003875; border:1px solid #003875"
                                    title="YouTube"><span>YouTube</span></a></div>
                        <a href="/social-media/" class="topplus">
                            <i class="fa fa-plus-square"></i></a>


                    </div>
                </section>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row devpreview">
        <div class="demo" id="user-view">
            <form id="data-form" action="" method="post" enctype="multipart/form-data">
                <input type="hidden" name="form_id" value="<?= $id ?>">
                <input type="hidden" name="date" value="<?= date("Y-m-d H:i:s"); ?>">
                <?= \yii\helpers\Html::decode($form['html']) ?>
                <div class="save-button">
                    <button id="save-data" type="button" class="btn btn-success">Save Data</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    var _Id = "<?=!empty($form['id']) ? $form['id'] : null?>";
</script>

