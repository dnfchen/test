<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>文件上传</title>

	</head>

	<body>
		<form action="upload" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td>
						姓名：
					</td>
					<td>
						<input type="text" name="name" />
					</td>
				</tr>
				<tr>
					<td>
						照片：
					</td>
					<td>
						<input type="file" name="photo"
							onchange="checkPhoto(this.files[0])" id="photo" />
						<img width="160px" height="160px" name="imgPhoto" id="imgPhoto" />
					</td>
				</tr>
				<tr>
					<td>
						照片2：
					</td>
					<td>
						<input type="file" name="photo2"
							onchange="checkPhoto(this.files[0])" id="photo2" />
						<img width="160px" height="160px" name="imgPhoto2" id="imgPhoto2" />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" name="btnSubmit" value="提交" />
					</td>
				</tr>
			</table>
		</form>

	</body>
</html>
