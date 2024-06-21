# Study-With-N-Project
## 1.Các chức năng của trang web 
### 1.1.Chức năng tìm kiếm
- Mô tả: Sử dụng ajax trong việc tìm kiếm, người dùng nhập đến đâu có thể xem được kết quả tìm kiếm đến đó
  - Tìm kiếm các môn học do hệ thống viết
  - Tìm kiếm các bài viết của người dùng 
  - Tìm kiếm tài khoản của người dùng
- Chức năng riêng đối với người dùng có tài khoản
  - Có thể xem được trang cá nhân của người dùng trên kết quả tìm kiếm
  - Đối với các bài viết hiển thị trên kết quả tìm kiếm
    - Nếu bài viết đó là của người dùng đang tìm kiếm: có thể bấm vào bài viết và chỉnh sửa nó
    - Nếu bài viết đó là của người dùng khác: có thể bấm vào bìa viết đó để xem vị trị của nó trên trang cá nhân của tác giả
  
### 1.2.Đăng ký, đăng nhập
- Mô tả:
  - Đối với chức năng đăng ký
    - Mật khẩu tối thiểu 6 kí tự
    - Tên tài khoản không kí tự trắng, không dấu
    - Tên email, tên đăng nhập không được trùng giữa các tài khoản
  - Đối với chức năng đăng nhập
    - kiểm tra tên tài khoản và mật khẩu có tồn tại trong bảng user của cơ sở dữ liệu
### 1.3.Chức năng bình luận
#### 1.3.1.Bình luận trên các bài viết về môn học của hệ thống (admin) 
 - Mô tả: tất cả các bài viết về môn học của hệ thống (admin), người dùng có tài khoản đều có thể viết bình luận và xóa bình luận trên đó
#### 1.3.2.Bình luận trên các bài viết của người dùng khác 
 - Mô tả: chức năng bình luận sẽ tùy thuộc vào chế độ hiển thị bài viết của người dùng mà chúng ta muốn bình luận
   - Bài viết ở chế độ công khai: Tất cả người dùng có tài khoản đều có thể xem và bình luận được
   - Bài viết ở chế độ theo dõi: Chỉ có những người đã follow tác giả của bài viết đó mới có thể xem và bình luận được
   - Bài viết ở chế độ riêng tư: Chỉ duy nhất tác giả bài viết đó mới có thể xem và bình luận 
    
## 2.Video demo 
- Link video trên youtube : 


    

