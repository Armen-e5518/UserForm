<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 4/20/17
 * Time: 12:42 PM
 */

namespace common\components;


use backend\models\FormsData;
use common\models\Forms;
use common\models\User;

class Helper
{
    public static function Out($x)
    {
        echo '<pre>';
        print_r($x);
        echo '</pre>';
    }

    public static function FileUpload($file, $post)
    {
        if (!empty($file)) {
            $arr = [];
            $flag = true;
            foreach ($file as $name => $value) {
                if (!empty($value['name'])) {
                    $target_dir = \Yii::$app->basePath . '/web/uploads/';
                    $name_array = explode(".", basename($file[$name]["name"]));
                    $format = end($name_array);
                    $file_name = md5(microtime(true));
                    $target_file = $target_dir . $file_name . '.' . $format;
                    if (!move_uploaded_file($file[$name]["tmp_name"], $target_file)) {
                        $flag = false;
                    } else {
                        $arr[$name] = $file_name . '.' . $format;
                    }
                }
            }
            if ($flag) {
                foreach ($arr as $k => $f_name) {
                    $post[$k] = $f_name;
                }
            }
        }
        return $post;
    }

    public static function CheckFormIdByUrl($url)
    {
        if (!empty($url)) {
            $model = Forms::GetFormIdByUrl($url);
            if (!empty($model)) {
                return $model['id'];
            };
        }
        return null;
    }


    public static function GetZipUrl($form_id = null, $form_data_id = null)
    {
        if (!empty($form_id) && !empty($form_data_id)) {
            $data = FormsData::GetFormDataByFormIdByDataId($form_id, $form_data_id);
            if (!empty($data)) {
                $flag = false;
                $phat = \Yii::$app->basePath . '/web/uploads/';
                $zip_file = $phat . 'zip/' . $data['user_first_name_1'] . '_' . $data['user_last_name_1'] . '.zip';
                if (file_exists($zip_file)) {
                    unlink($zip_file);
                }
                $zip = new \ZipArchive();
                if ($zip->open($zip_file, \ZipArchive::CREATE) !== TRUE) {
                    throw new \Exception('Cannot create a zip file');
                }
                foreach ($data as $kay => $d) {

                    if ((!(strripos($kay, 'file_') === false) && $d != null)) {
                        $zip->addFile($phat . $d, $d);
                        $flag = true;
                    }
                }
                $zip->close();
                return $zip_file;
            }
        }
        return null;
    }

}