<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Request;

class User extends Model
{
  public function login()
  {
//    应用Request::get()方法获取传参
    if (!(Request::get('username') && Request::get('password')))
      return ['status' => 0, 'msg' => 'username and password are required'];
    return [
      'status'=>1,
      'data'=>[
      'id'=>'001',
      'username'=>Request::get('username')
      ]
    ];
  }
}
