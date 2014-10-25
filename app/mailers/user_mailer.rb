class UserMailer < ActionMailer::Base
  default form: 'yf-manager@qq.com'
  def confirm( email )
    mail to: email, subject: '统一通行证注册确认邮件', body: '感谢您注册统一通行证！'
  end
end
