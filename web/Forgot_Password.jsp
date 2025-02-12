<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <title>Quên mật khẩu</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <%@ include file="Header.jsp" %>

        <div class="d-flex justify-content-center align-items-center vh-100">
            <div class="card shadow p-4 text-center" style="width: 350px;">
                <h2 class="mb-3">Quên mật khẩu</h2>
                <p class="text-muted">Nhập email của bạn để đặt lại mật khẩu</p>
                <form action="Forgot_password" method="post">
                    <div class="mb-3">
                        <input type="email" name="email" class="form-control" placeholder="Nhập email của bạn" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Gửi yêu cầu</button>
                </form>
                <p class="mt-3"><a href="login.jsp" class="text-decoration-none">Quay lại đăng nhập</a></p>
            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>