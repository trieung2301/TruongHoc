<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Services\AuthService;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;

class AuthController extends Controller
{
    protected $authService;

    public function __construct(AuthService $authService)
    {
        $this->authService = $authService;
    }

    // Xử lý đăng nhập và trả về Token
    public function login(Request $request): JsonResponse
    {
        $result = $this->authService->login($request);
        return response()->json($result, $result['status'] ?? 200);
    }

    // Lấy thông tin User đang đăng nhập từ Token
    public function me(Request $request): JsonResponse
    {
        $result = $this->authService->me($request);
        return response()->json($result);
    }

    // Đổi mật khẩu cho User hiện tại
    public function changePasswordHash(Request $request): JsonResponse
    {
        $result = $this->authService->changePassword($request);
        return response()->json($result);
    }

    // Admin reset mật khẩu cho một User bất kỳ
    public function resetPassword(Request $request): JsonResponse
    {
        $result = $this->authService->resetPassword($request);
        return response()->json($result);
    }

    // Đăng xuất và xóa Token
    public function logout(Request $request): JsonResponse
    {
        $result = $this->authService->logout($request);
        return response()->json($result);
    }
}