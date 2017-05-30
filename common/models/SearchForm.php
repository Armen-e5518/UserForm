<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "search_form".
 *
 * @property integer $id
 * @property integer $form_id
 * @property string $column_name
 */
class SearchForm extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'search_form';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['form_id'], 'integer'],
            [['column_name'], 'string', 'max' => 30],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'form_id' => 'Form ID',
            'column_name' => 'Column Name',
        ];
    }

    public static function SaveFormSearchColumn($form_id, $column_name)
    {
        if (!empty($form_id) && !empty($column_name)) {
            $model = new self();
            $model->form_id = $form_id;
            $model->column_name = $column_name;
            return $model->save();
        }
        return false;
    }

    public static function DeleteFormSearchColumn($form_id)
    {
        if (!empty($form_id)) {
            return self::deleteAll(['form_id' => $form_id]);
        }
        return false;
    }

    public static function GetColumnNameByFormId($form_id)
    {
        if (!empty($form_id)) {
            return self::findAll(['form_id' => $form_id]);
        }
        return [];
    }

    public static function GetColumnNameByFormIdArray($form_id)
    {
        if (!empty($form_id)) {
            return self::find()->select('column_name')->where(['form_id' => $form_id])->asArray()->column();
        }
        return [];
    }
}
