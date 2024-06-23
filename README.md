<<<<<<< HEAD
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

### 1.3.Chức năng tạo bài viết
 - Mô tả: bất kì người dùng nào có tài khoản trên hệ thống đều có thể tự tạo bài viết trên trang cá nhân của mình với 3 chế độ:
   - Công khai:
     - bất kì người dùng nào có tài khoản trên hệ thông có thể xem, like, bình luận trên bài viết đó
     - người dùng không có tài khoản chỉ có thể xem nội dung của bài viết đó thông qua tìm kiếm
   - Người theo dõi:
     - Chỉ người dùng nào có tài khoản trên hệ thông đã **theo dõi** tác giả bài viết đó mới có thể xem, like, bình luận trên bài viết đó
     - người dùng không có tài khoản không thể xem được
   - Riêng tư:
     - Chỉ duy nhất tác giả bài viết đó mới có thể xem, like, bình luận trên bài viết đó
- Chế độ hiển thị
    - Danh sách các bài viết được hiển thị theo thứ tự ưu tiên các bài viết gần đây nhất mà họ đã đăng
    - Bộ lọc hiển thị:
      - Tất cả: bao gồm các bài viết ở cả 3 chế độ
      - Công khai: các bài viết ở chế độ công khai
      - Người theo dõi: các bài viết ở chế độ người theo dõi
      - Chỉ mình tôi: các bài viết ở chế độ chỉ mình tôi

### 1.4.Chức năng theo dõi giữa người dùng với người dùng
#### 1.4.1.Chế độ hiển thị 
 - Các chế độ hiển thị mối quan hệ giữa 2 người dùng
   - Bạn bè: khi cả bạn và người dùng đều theo dõi nhau
   - Đang theo dõi: khi bạn theo dõi người dùng khác nhưng người dùng đó không theo dõi bạn
   - Theo dõi lại: khi người dùng khác theo dõi bạn nhưng bạn không theo dõi người dùng đó 
 - Bạn có thể biết được người dùng nào đã theo dõi mình hoặc bản thân mình đã theo dõi họ qua:
   - Dánh sách lượt like trên bài viết của bạn: sẽ hiển thị những người dùng đã like bài viết của bạn
   - Vào trang cá nhân của người dùng: thông qua tên của họ ở:
     - những dòng bình luận trên các bài viết của bạn
     - các bài viết của họ trên Trang cộng đồng
     - các bình luận của họ trên bài viết của hệ thống(admin)

#### 1.4.2.Chức năng
 - Mô tả: khi bạn theo dõi một người dùng nào đó bạn có thể xem, like, bình luận được các bài viết không chỉ của người dùng đó ở chế độ công khai mà còn có thể xem, like, bình luận trên các bài viết ở chế độ Người người dõi của họ
   
### 1.5.Chức năng bình luận
#### 1.5.1.Bình luận trên các bài viết về môn học của hệ thống (admin) 
 - Mô tả: tất cả các bài viết về môn học của hệ thống (admin), người dùng có tài khoản đều có thể viết bình luận và xóa bình luận trên đó
#### 1.5.2.Bình luận trên các bài viết của người dùng khác 
 - Mô tả: chức năng bình luận sẽ tùy thuộc vào chế độ hiển thị bài viết của người dùng mà chúng ta muốn bình luận
   - Bài viết ở chế độ công khai: Tất cả người dùng có tài khoản đều có thể xem và bình luận được
   - Bài viết ở chế độ theo dõi: Chỉ có những người đã follow tác giả của bài viết đó mới có thể xem và bình luận được
   - Bài viết ở chế độ riêng tư: Chỉ duy nhất tác giả bài viết đó mới có thể xem và bình luận 

### 1.6.Chức năng like bài viết của những người dùng trên trang web
 - Mô tả: chức năng like bài viết phụ thuộc vào chế độ hiển thị của bài viết đó: công khai, người theo dõi, riêng tư

## 2.Video demo 
- Link video trên youtube: https://youtu.be/TcNtlN28tL8


    

=======
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

### 1.3.Chức năng tạo bài viết
 - Mô tả: bất kì người dùng nào có tài khoản trên hệ thống đều có thể tự tạo bài viết trên trang cá nhân của mình với 3 chế độ:
   - Công khai:
     - bất kì người dùng nào có tài khoản trên hệ thông có thể xem, like, bình luận trên bài viết đó
     - người dùng không có tài khoản chỉ có thể xem nội dung của bài viết đó thông qua tìm kiếm
   - Người theo dõi:
     - Chỉ người dùng nào có tài khoản trên hệ thông đã **theo dõi** tác giả bài viết đó mới có thể xem, like, bình luận trên bài viết đó
     - người dùng không có tài khoản không thể xem được
   - Riêng tư:
     - Chỉ duy nhất tác giả bài viết đó mới có thể xem, like, bình luận trên bài viết đó
- Chế độ hiển thị
    - Danh sách các bài viết được hiển thị theo thứ tự ưu tiên các bài viết gần đây nhất mà họ đã đăng
    - Bộ lọc hiển thị:
      - Tất cả: bao gồm các bài viết ở cả 3 chế độ
      - Công khai: các bài viết ở chế độ công khai
      - Người theo dõi: các bài viết ở chế độ người theo dõi
      - Chỉ mình tôi: các bài viết ở chế độ chỉ mình tôi

### 1.4.Chức năng theo dõi giữa người dùng với người dùng
#### 1.4.1.Chế độ hiển thị 
 - Các chế độ hiển thị mối quan hệ giữa 2 người dùng
   - Bạn bè: khi cả bạn và người dùng đều theo dõi nhau
   - Đang theo dõi: khi bạn theo dõi người dùng khác nhưng người dùng đó không theo dõi bạn
   - Theo dõi lại: khi người dùng khác theo dõi bạn nhưng bạn không theo dõi người dùng đó 
 - Bạn có thể biết được người dùng nào đã theo dõi mình hoặc bản thân mình đã theo dõi họ qua:
   - Dánh sách lượt like trên bài viết của bạn: sẽ hiển thị những người dùng đã like bài viết của bạn
   - Vào trang cá nhân của người dùng: thông qua tên của họ ở:
     - những dòng bình luận trên các bài viết của bạn
     - các bài viết của họ trên Trang cộng đồng
     - các bình luận của họ trên bài viết của hệ thống(admin)

#### 1.4.2.Chức năng
 - Mô tả: khi bạn theo dõi một người dùng nào đó bạn có thể xem, like, bình luận được các bài viết không chỉ của người dùng đó ở chế độ công khai mà còn có thể xem, like, bình luận trên các bài viết ở chế độ Người người dõi của họ
   
### 1.5.Chức năng bình luận
#### 1.5.1.Bình luận trên các bài viết về môn học của hệ thống (admin) 
 - Mô tả: tất cả các bài viết về môn học của hệ thống (admin), người dùng có tài khoản đều có thể viết bình luận và xóa bình luận trên đó
#### 1.5.2.Bình luận trên các bài viết của người dùng khác 
 - Mô tả: chức năng bình luận sẽ tùy thuộc vào chế độ hiển thị bài viết của người dùng mà chúng ta muốn bình luận
   - Bài viết ở chế độ công khai: Tất cả người dùng có tài khoản đều có thể xem và bình luận được
   - Bài viết ở chế độ theo dõi: Chỉ có những người đã follow tác giả của bài viết đó mới có thể xem và bình luận được
   - Bài viết ở chế độ riêng tư: Chỉ duy nhất tác giả bài viết đó mới có thể xem và bình luận 

### 1.6.Chức năng like bài viết của những người dùng trên trang web
 - Mô tả: chức năng like bài viết phụ thuộc vào chế độ hiển thị của bài viết đó: công khai, người theo dõi, riêng tư

## 2.Video demo 
- Link video trên youtube: https://youtu.be/TcNtlN28tL8


    

>>>>>>> 0c2f8caaf44a2b017447cd2137e08ce60e9f2a61
