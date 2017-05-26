require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

# test para usuarios validos
  test "should be valid" do
    assert @user.valid?
  end

# test para usuarios estén presentes
# [en conjunto con las validaciones de presencia en: app/models/user.rb]
  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end

# test para emails estén presentes
# [en conjunto con las validaciones de presencia en: app/models/user.rb]
  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

# test para nombre longitud
# en este caso: no mas de 51 caracteres
  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

# test para emails longitud
# en este caso: no mas de 244 caracteres + @ + dirección de mail
  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

# test para emails validos/reales
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

# test para emails unicos
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

# test para emails se guarden con minúsculas
  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

# test para password no vacio
  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

# test para password con mínimo 6 caracteres
  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end