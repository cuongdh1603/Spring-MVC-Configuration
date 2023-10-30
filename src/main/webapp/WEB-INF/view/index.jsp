<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/index_style.css" type="text/css">
</head>
<body style="background-color: #dddddd">
<div class="container">
	
    <div class="row" style="height: 5px;background-color: #ffffff"></div>
    <div class="row header">
        <div class="col-md-1" style="margin-left: -15px">
            <img src="/resources/img/logo.PNG" style="width: 100%;height: 100%">
        </div>
        <p>Now: ${date}</p>
        <div class="col-md-8 vertical-center-item">
            <h2 class="align-middle">HỆ THỐNG QUẢN LÝ SINH VIÊN</h2>
        </div>
        <div class="col-md-3 text-end">
            <span>Xin chào: Nguyễn Văn A</span>
            <span>
                [
                <a href="/logout">Đăng xuất</a>
                ]
            </span>
        </div>
    </div>
    <div class="row" style="height: 5px; background-color: #ffffff"></div>
    <div class="row menu" style="padding: 10px; color: white;background-color: darkblue">
        Menu
    </div>
    <div class="row content">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-10">
                    <h2>Danh sách sinh viên</h2>
                </div>
                <div>
                    <a href="/create-new1/10/test-name" style="text-decoration: none">Thêm mới 1</a><br>
                    <a href="/create-new2?id=10&name=test" style="text-decoration: none">Thêm mới 2</a>
                </div>
            </div>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>STT</th>
                    <th>Mã sinh viên</th>
                    <th>Họ tên</th>
                    <th>Khoa/Viện</th>
                    <th>Lớp</th>
                    <th>Điểm GPA</th>
                    <th>Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>20211234</td>
                    <td>Nguyễn Văn B</td>
                    <td>Công nghệ thông tin</td>
                    <td>CNTT201</td>
                    <td>3.4</td>
                    <td>
                        <button class="btn btn-info">Chi tiết</button>
                        <button class="btn btn-primary">Sửa</button>
                        <button class="btn btn-danger">Xóa</button>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>20212345</td>
                    <td>Nguyễn Văn C</td>
                    <td>Công nghệ thông tin</td>
                    <td>CNTT201</td>
                    <td>5.7</td>
                    <td>
                        <button class="btn btn-info">Chi tiết</button>
                        <button class="btn btn-primary">Sửa</button>
                        <button class="btn btn-danger">Xóa</button>
                    </td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>20213456</td>
                    <td>Nguyễn Văn E</td>
                    <td>Điện tử viễn thông</td>
                    <td>CNTT201</td>
                    <td>7.9</td>
                    <td>
                        <button class="btn btn-info">Chi tiết</button>
                        <button class="btn btn-primary">Sửa</button>
                        <button class="btn btn-danger">Xóa</button>
                    </td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>20212007</td>
                    <td>Nguyễn Văn F</td>
                    <td>An toàn thông tin</td>
                    <td>CNTT201</td>
                    <td>3.46</td>
                    <td>
                        <button class="btn btn-info">Chi tiết</button>
                        <button class="btn btn-primary">Sửa</button>
                        <button class="btn btn-danger">Xóa</button>
                    </td>
                </tr>
                </tbody>
            </table>
            <form action="add">
		    	<input type="text" name = "t1"><br>
		    	<input type="text" name = "t2"><br>
		    	<input type = "submit">
		    	<p>Result is: ${result}</p>	
				<a href="/customer-welcome" style="color: green;text-decoration: null">Go to customer page</a> 
		    </form>
		    <form action="name">
			    <label>Nhập họ tên:</label>
			    <input type = "text" name = "t3">
			    <br>
			    <button >Chuyển đổi tên</button>
			    <p>Tên bạn là: ${name}</p>
		    </form>
		    
        </div>
    </div>
    
    <div class="row footer" style="text-align: center;background-color: #000033;color: white">
        <div class="col-md-12">
            Trung tâm code fresher <br>
            Địa chỉ: Số 104 Hoàng Ngân, Trung Hoà, Cầu Giấy, Hà Nội <br>
            Điện thoại: 096.577.6812
        </div>
    </div>
</div>
</body>
</html>