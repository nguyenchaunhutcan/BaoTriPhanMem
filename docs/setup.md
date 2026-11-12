# Chuẩn bị môi trường OSPOS

## Trạng thái

Đã xác nhận nguồn OSPOS 3.4.3 và tạo mốc Git bản gốc. Ứng dụng chưa được cài đặt hoặc kiểm chứng chạy thành công. Chưa có kết quả kiểm thử ứng dụng.

Máy chuẩn bị repo đã có Git, Node.js và Docker Desktop. Mỗi thành viên cần kiểm tra lại môi trường trên máy mình; ghi phiên bản thực tế vào nhật ký khi thực hiện.

## Bước tiếp theo do người học thực hiện

Mở Docker Desktop và đợi engine hoạt động. Tại terminal, chạy từng lệnh:

```powershell
docker version
docker compose version
```

`docker version` cần có cả Client và Server. Ghi nhận phiên bản Docker Compose và lỗi nếu xuất hiện.

## Trước khi dựng ứng dụng

1. Đọc `Code/ospos/docs/INSTALL.md`, `Code/ospos/docs/BUILD.md` và `Code/ospos/composer.json` tại phiên bản đã chọn.
2. Chọn cấu hình PHP và MariaDB/MySQL phù hợp; cố định phiên bản để các thành viên tái lập được.
3. Chuẩn bị `.env` cục bộ dựa trên `.env.example`. Không đưa cấu hình thật vào Git.
4. Chuẩn bị dependencies và build assets theo hướng dẫn upstream.
5. Khởi tạo cơ sở dữ liệu, chạy ứng dụng và ghi lại kết quả thực tế.

File Compose upstream tham chiếu image `jekkos/opensourcepos:master`. Cần đối chiếu hoặc cấu hình build từ mã nguồn 3.4.3 trước khi sử dụng, để ứng dụng chạy đúng bản đã chọn. Chưa coi việc có file Compose là đã dựng xong môi trường.

## Nhật ký cài đặt

Khi thực hiện, ghi lại ngày, người thực hiện, hệ điều hành, phiên bản công cụ, lệnh, kết quả và cách xử lý lỗi. Lưu ảnh hoặc log đã loại bỏ thông tin riêng tư dưới `evidence/setup/`.

Sau khi đăng nhập và chạy được các luồng nghiệp vụ cơ bản, cập nhật tài liệu này bằng các bước đã kiểm chứng và bắt đầu khảo sát hiện trạng.
