# Bảo trì phần mềm với Open Source POS

Project 2 của học phần CT244H Bảo trì phần mềm, Đại học Cần Thơ. Nhóm khảo sát một sản phẩm có sẵn, đề xuất thay đổi, thực hiện bảo trì và lưu bằng chứng kiểm thử.

**Sản phẩm được chọn:** Open Source Point of Sale (OSPOS) 3.4.3, viết bằng PHP và CodeIgniter 4, sử dụng MySQL/MariaDB.

**Trạng thái:** đã chọn sản phẩm và chuẩn bị repository. Việc cài đặt ứng dụng, khảo sát lỗi và thực hiện các yêu cầu bảo trì chưa được hoàn thành.

## Cấu trúc

```text
.
├── Code/
│   └── ospos/                # Toàn bộ mã nguồn OSPOS và các thay đổi sau này
├── Yêu cầu/                  # Đề bài và biểu mẫu giảng viên cung cấp
├── Báo cáo/                  # Báo cáo Word, slide và kịch bản demo
├── docs/
│   ├── baseline.json         # Nguồn gốc và định danh phiên bản gốc
│   ├── setup.md              # Nhật ký và hướng dẫn chuẩn bị môi trường
│   ├── workflow.md           # Quy ước Git và quy trình làm việc
│   └── maintenance/          # Yêu cầu thay đổi và bảng truy vết
├── evidence/                 # Minh chứng trước và sau bảo trì
├── scripts/                  # Công cụ hỗ trợ repository
└── .github/                  # Mẫu issue, pull request và kiểm tra cấu trúc
```

Giữ tên ba thư mục ban đầu để nhóm thuận tiện đối chiếu với tài liệu học phần. Repository này chứa trực tiếp mã nguồn, không sử dụng submodule và chỉ cần clone một lần.

## Bắt đầu

```powershell
git clone https://github.com/nguyenchaunhutcan/BaoTriPhanMem.git
cd BaoTriPhanMem
git status
git tag --list
pwsh -File ./scripts/check-repository.ps1
```

Để tiếp tục cài đặt, đọc [chuẩn bị môi trường](docs/setup.md). Các lệnh build, Composer và npm phải chạy trong `Code/ospos`; các lệnh quản lý Git có thể chạy ở gốc repository.

## Phiên bản gốc

- Upstream: <https://github.com/opensourcepos/opensourcepos>
- Release: [3.4.3](https://github.com/opensourcepos/opensourcepos/releases/tag/3.4.3)
- Commit upstream: `35b68245a00bb66b40aea53e2be3478e4558854d`
- Mốc cục bộ: `baseline-ospos-3.4.3`

Tag baseline chứa ảnh chụp nguyên vẹn mã nguồn upstream dưới `Code/ospos`. Lịch sử làm bài bắt đầu bằng commit nhập bản gốc, tiếp theo là commit thiết lập repository. Thông tin máy đọc được nằm trong [baseline.json](docs/baseline.json).

```powershell
git diff baseline-ospos-3.4.3 -- Code/ospos
```

Lệnh trên cho biết mã nguồn đã thay đổi thế nào kể từ phiên bản gốc.

## Phạm vi học phần

Đề bài yêu cầu đề xuất tối thiểu 3 yêu cầu hiệu chỉnh lỗi, 3 thích ứng, 3 hoàn thiện và 2 dự phòng. Yêu cầu cụ thể chỉ được chốt sau khi khảo sát sản phẩm. Nhóm viết báo cáo song song với hoạt động bảo trì.

Nội dung báo cáo gồm kế hoạch bảo trì, phân tích tác động, đặc tả, thiết kế và kiểm thử. Hồ sơ nộp gồm báo cáo Word, slide PowerPoint và kịch bản demo. Đọc đề bài gốc trong `Yêu cầu/` khi cần đối chiếu.

## Làm việc và kiểm tra

- [Quy trình Git](docs/workflow.md)
- [Hồ sơ và truy vết yêu cầu](docs/maintenance/README.md)
- [Quy ước lưu minh chứng](evidence/README.md)
- [Chuẩn bị báo cáo](Báo%20cáo/README.md)
- [Nguồn và giấy phép](THIRD_PARTY_NOTICES.md)

CI ở gốc repo chỉ kiểm tra cấu trúc và mốc bản gốc. Kiểm thử PHP của ứng dụng nằm trong `Code/ospos/tests/` và được thực hiện sau khi dựng đủ môi trường.
