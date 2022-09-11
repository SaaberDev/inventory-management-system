<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Contracts\Auth\Authenticatable;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

define('SUPER_ADMIN', 'saaberdev@gmail.com');
define('ADMIN', 'admin@gmail.com');
define('MANAGER', 'manager@gmail.com');

class LoginAsController extends Controller
{
    protected Authenticatable $user;

    /**
     * Handle the incoming request.
     *
     * @param Request $request
     * @return JsonResponse
     */
    public function __invoke(Request $request)
    {
        $login_as = $request->get('param');
        $find_user = function ($email) {
            $this->user =  User::where('email', '=', $email)->first();
        };

        // PHP 8 Only
        match ($login_as) {
            'super_admin' => $find_user(SUPER_ADMIN),
            'admin' => $find_user(ADMIN),
            'manager' => $find_user(MANAGER),
            'default' => response()->json('Could not find user')
        };

        // uncomment this if your PHP version is less than 8
        /*switch ($login_as) {
            case 'super_admin':
                $find_user(SUPER_ADMIN);
                break;

            case 'admin';
                $find_user(ADMIN);
                break;

            case 'manager';
                $find_user(MANAGER);
                break;

            default:
                return response()->json('Could not find user');
        }*/

        Auth::login($this->user);

        return response()->json([
            'msg' => 'Logged in successful',
            'redirect' => redirect()->intended()->getTargetUrl()
        ]);
    }
}
