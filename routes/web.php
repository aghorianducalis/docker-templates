<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

// http://docker-simple.local:8082/test
Route::get('/test', function () {
    $users = \App\Models\User::factory()->count(3)->create();

    return \App\Models\User::all()->toJson();
});
