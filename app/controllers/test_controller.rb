class TestController < ApplicationController
  def index
    meta_tag('Test', 'Test')
    @result = {:username=>"HinTeen Truong", :avatar=>"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xlp1/v/t1.0-1/p200x200/14457280_915577778575711_4450782808693385418_n.jpg?oh=ed082290603851ea9afaf066756f4d24&oe=58621490&__gda__=1483321589_826d6967f884e1e8c20e59e7d7abe4c5", :l_picture=>"http://c1.staticflickr.com/9/8279/29731717600_f424df370e_m.jpg", :l_text=>"Sư Tử", :r_picture=>"http://c3.staticflickr.com/9/8425/29397847034_d49043a704_m.jpg", :r_text=>"Kim Ngưu", :content=>"Nam Kim Ngưu là người biết tiến biết lùi đúng lúc, anh chàng sẽ luôn biết cách giữ thể diện và tạo sự vui vẻ, hài lòng cho bạn.", :layout=>"layout_001"}

    html_content = render_to_string(:template => 'answers/layout_001.html.slim', layout: 'jpg_application', :locals => { :result => @result })

    kit = IMGKit.new(html_content)

    respond_to do |format|
      format.html
      format.jpg {  send_data(kit.to_jpg, :type => "image/jpeg", :disposition => 'inline') }
    end
  end
end