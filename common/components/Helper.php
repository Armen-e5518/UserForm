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
//                    $target_dir = \Yii::$app->basePath . '/web/uploads/';
                    $target_dir = \Yii::$app->params['root_path'] . 'backend/web/uploads/';
                    $name_array = explode(".", basename($file[$name]["name"]));
                    $format = end($name_array);
                    $file_name = md5(microtime(true) + rand(1, 100));
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
                $zip_file = $phat . 'zip/' . $data['user_first_name_1'] . '_' . $data['user_last_name_1'] . '_' . $form_id . '_' . $form_data_id . '.zip';
                if (file_exists($zip_file)) {
                    unlink($zip_file);
                }
                fopen($zip_file, 'w');
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
                return [
                    'zip' => $zip_file,
                    'flag' => $flag,
                ];
            }
        }
        return null;
    }

    public static function SendMail($post = null, $form_id = null, $id = null)
    {
        if (!empty($post) && !empty($form_id) && !empty($id)) {
            $email_data = Forms::GetEmailDataById($form_id);
            $Subject = !empty($email_data['email_subject']) ? $email_data['email_subject'] : 'Thanks';
            $Body = !empty($email_data['email_text']) ? $email_data['email_text'] : 'Thanks';
            foreach ($post as $kay => $data) {
                if (!(strripos($kay, 'user_email') === false)) {
                    return \Yii::$app->mailer->compose()
                        ->setFrom(\Yii::$app->params['mail']['from'])
                        ->setTo($data)
                        ->setSubject($Subject)
                        ->setTextBody($Body)
                        ->send();
                }
            }
        }
        return false;
    }

    public static function SendMailAdmin($post = null, $form_id = null, $id = null)
    {
        if (!empty($post) && !empty($form_id) && !empty($id)) {
            $email_data = Forms::GetEmailDataById($form_id);
            $Subject = 'New User Data';
            $pdf = \Yii::$app->params['domain'] . '/admin/users-form/form?fid=' . $form_id . '&id=' . $id . '&pdf=1';
            $Body = '<a href="' . $pdf . '">Download Pdf</a>';
            return \Yii::$app->mailer->compose()
                ->setFrom(\Yii::$app->params['mail']['from'])
                ->setTo($email_data['email'])
                ->setSubject($Subject)
                ->setHtmlBody($Body)
                ->send();

        }
        return false;
    }


    public static function GetFileArrayByData($data = null)
    {
        if (!empty($data)) {
            foreach ($data as $kay => $d) {
                if ((!(strripos($kay, 'file_') === false))) {

                }
            }
        }
    }

}