class User < ApplicationRecord

  has_secure_password

  # validates
  validates :name, presence: true,
                    length: { maximum: 30, allow_blank: true }
                    VALID_PASSWORD_REGEX = /\A[\w\-]+\z/

validates :password, presence: true,                            #空白文字を許容しない
                      length: { minimum: 8,allow_blank:true },                   #最小文字数
                      format: {                                  #最小文字数
                      with: VALID_PASSWORD_REGEX,
                      message: :invalid_password,
                      allow_blank:true},
                      allow_nil: true
end
