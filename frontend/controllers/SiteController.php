<?php
namespace frontend\controllers;

use common\components\Helper;
use common\models\Dynamic;
use common\models\Forms;
use Yii;
use yii\web\Controller;



class SiteController extends Controller
{
    public function beforeAction($action)
    {
        $this->enableCsrfValidation = false;
        return parent::beforeAction($action);
    }

    public function actionView($id)
    {
        $id = Helper::CheckFormIdByUrl($id);
        if(empty($id)){
            echo  '404 error';
            exit;
        }
        $post = Yii::$app->request->post();
        $post = Helper::FileUpload($_FILES,$post);
        if (!empty($post)) {
            $model = new Dynamic();
            $model->RunModel('form_' . $id, $post);
            if ($model->SaveData()) {
                Yii::$app->session->setFlash('success', 'Saved...');
            } else {
                Yii::$app->session->setFlash('error', 'Error...');
            }
        }
        return $this->render('view', [
            'form' => Forms::GetFormByIdView($id),
            'id' => $id,
        ]);
    }

}
