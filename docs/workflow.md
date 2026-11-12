# Quy trình Git của nhóm

## Repository và phiên bản gốc

Repository Git nằm ở gốc dự án. `Code/ospos/` là thư mục mã nguồn thông thường, không còn là một Git repository độc lập. Khi đứng tại `Code/ospos`, lệnh Git vẫn thao tác trên repository của nhóm.

- `origin`: `https://github.com/nguyenchaunhutcan/BaoTriPhanMem.git`
- Nhánh tích hợp: `main`
- Mốc bản gốc: `baseline-ospos-3.4.3`

Không sửa, ghi đè hoặc di chuyển tag bản gốc. So sánh mã nguồn với mốc này bằng:

```powershell
git diff baseline-ospos-3.4.3 -- Code/ospos
```

## Mỗi yêu cầu thay đổi

1. Khảo sát và thu bằng chứng, đặt mã `CR-001`, `CR-002`, ...
2. Ghi loại bảo trì, mức ưu tiên và liên kết yêu cầu gốc nếu có.
3. Phân tích tác động, so sánh ít nhất hai giải pháp và ghi quyết định của nhóm.
4. Tạo nhánh theo yêu cầu, ví dụ `fix/CR-001-short-description` hoặc `feat/CR-002-short-description`.
5. Cập nhật đặc tả, thiết kế, mã nguồn và kiểm thử tương ứng.
6. Xem diff, chạy kiểm tra phù hợp rồi commit. Dùng mẫu pull request khi nhóm cần review.

Ví dụ tạo nhánh sau khi yêu cầu thực tế đã được thống nhất:

```powershell
git switch main
git switch -c fix/CR-001-short-description
```

## Commit

Dùng tiền tố `chore`, `docs`, `fix`, `feat`, `refactor` hoặc `test`. Với thay đổi bảo trì, đưa mã yêu cầu vào nội dung commit, ví dụ `fix(CR-001): describe the actual behavior corrected`.

Chỉ stage những file đã xem xét. Không dùng kết quả kiểm thử dự kiến thay cho kết quả thực tế.

## Push

Lần push khởi tạo đã được người dùng yêu cầu. Sau lần đó, trợ lý chỉ hướng dẫn và không tự push; người dùng sẽ thông báo khi cần push tiếp.

Mã nguồn upstream có hướng dẫn phát triển dành cho dự án gốc. Trong repo học phần này, dùng nhánh `main` và remote của nhóm; không push vào repository upstream.

## Kiểm tra

Ở gốc dự án:

```powershell
pwsh -File ./scripts/check-repository.ps1
git diff --check
git status --short
```

Sau khi đã cài môi trường ứng dụng, chạy kiểm thử liên quan trong `Code/ospos/` theo hướng dẫn của upstream. Kiểm tra cấu trúc repo không thay thế kiểm thử chức năng hay kiểm thử hồi quy.
