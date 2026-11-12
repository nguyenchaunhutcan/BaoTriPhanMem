# Minh chứng thực hiện

Lưu bằng chứng để có thể đối chiếu hiện trạng, thay đổi và kết quả kiểm thử.

- `setup/`: các bước cài đặt và lỗi môi trường.
- Với mỗi yêu cầu, tạo `CR-001/before/`, `CR-001/after/` và `CR-001/tests/` khi có bằng chứng thực tế.
- Tên file nên mô tả nội dung, ví dụ `2026-11-12-login-page.png`.
- Ghi điều kiện tái hiện, dữ liệu thử, phiên bản và kết quả trong file Markdown đi cùng ảnh hoặc log.

Dùng dữ liệu giả cho demo. Loại bỏ mật khẩu, token, thông tin khách hàng thật và cấu hình riêng trước khi commit. Video dung lượng lớn có thể đặt liên kết trong hồ sơ thay vì đưa trực tiếp vào Git.
