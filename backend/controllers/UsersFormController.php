<?php
namespace backend\controllers;


use backend\models\FormsData;
use backend\models\FormsSearch;
use common\components\Helper;
use common\models\Forms;
use Yii;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;
use yii\web\Controller;


/**
 * Form Controller
 */
class UsersFormController extends Controller
{
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['index', 'form-data', 'form', 'view', 'form-pdf'],
                        'allow' => true,
                    ],
                    [
                        'actions' => ['index', 'form-data', 'form', 'view', 'form-pdf'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    public function actions(){
        if(Yii::$app->user->isGuest){
            $this->redirect('/admin/site/login');
        }
    }

    public function beforeAction($action)
    {
        $this->enableCsrfValidation = false;
        return parent::beforeAction($action);
    }

    public function actionIndex()
    {
        $searchModel = new FormsSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionFormData($id)
    {

        if (empty($id)) {
            $this->redirect('/admin/users-form');
        }
        $search = Yii::$app->request->post('search')?Yii::$app->request->post('search'):null;
        return $this->render('form-data', [
            'form_data' => FormsData::GetFormDataById($id, $search),
            'search' => $search
        ]);
    }

    public function actionForm($fid, $id)
    {
        return $this->render('form', [
            'form' => Forms::GetFormById($fid),
            'form_id' => $fid,
            'id' => $id,
            'pdf' => Yii::$app->request->get('pdf')
        ]);
    }

    public function actionFormPdf($fid, $id)
    {
        return $this->render('form-pdf', [
            'form' => Forms::GetFormById($fid),
            'form_id' => $fid,
            'id' => $id,
        ]);
    }
    public function actionFormPdfTest($fid, $id)
    {
        return $this->render('form-pdf', [
            'form' => Forms::GetFormById($fid),
            'form_id' => $fid,
            'id' => $id,
        ]);
    }
}
