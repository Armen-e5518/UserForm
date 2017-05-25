<?php

namespace common\models;

use Yii;
use yii\helpers\Html;

/**
 * This is the model class for table "forms".
 *
 * @property integer $id
 * @property string $url
 * @property string $name
 * @property string $html
 */
class Forms extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'forms';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['html'], 'string'],
            [['url'], 'string', 'max' => 38],
            [['name'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'url' => 'Url',
            'name' => 'Name',
            'html' => 'Html',
        ];
    }

    public static function SaveForm($data = null)
    {
        if (!empty($data)) {

            if (!empty($data['id'])) {
                $model = self::findOne(['id' => $data['id']]);
            } else {
                $model = new self();
            }
            $model->name = (string)$data['name'];
            $model->url = md5(microtime(true));
            $model->html = Html::encode($data['html']);;
            if ($model->save()) {
                return $model->id;
            } else {
                $model->getErrors();
            }

        }
    }

    public static function GetFormById($id)
    {
        $UsersForm = UsersForms::GetUsersFormsByThisUser();
        if ( $UsersForm['rol'] == 'ADMIN' && !in_array($id, $UsersForm['data'])) {
            return [];
        }
        return self::findOne(['id' => $id]);
    }

    public static function GetFormByIdView($id)
    {
        return self::findOne(['id' => $id]);
    }

    public static function GetFormIdByUrl($id)
    {
        return self::findOne(['url' => $id]);
    }

    public static function FormExistById($id)
    {
        return self::findOne(['id' => $id]);
    }

    public static function GetAllForms()
    {
        $UsersForm = UsersForms::GetUsersFormsByThisUser();
        if ( $UsersForm['rol'] == 'SUPER_ADMIN' ) {
            return self::find()->select(['name','id'])->indexBy('id')->column();
        }
        if ( $UsersForm['rol'] == 'ADMIN' ) {
            return self::find()->select(['name','id'])->where(['id' => $UsersForm['data']])->indexBy('id')->column();
        }


    }

    public static function GetAllFormsIds(){
        $UsersForm = UsersForms::GetUsersFormsByThisUser();
        if ( $UsersForm['rol'] == 'SUPER_ADMIN' ) {
            return self::find()->select(['id','name'])->asArray()->all();
        }
        if ( $UsersForm['rol'] == 'ADMIN' ) {
            return self::find()->select(['id','name'])->where(['id' => $UsersForm['data']])->asArray()->all();
        }
    }

}
