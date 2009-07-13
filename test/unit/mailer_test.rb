require 'test_helper'

class MailerTest < ActionMailer::TestCase
  test "password_reset_instructions" do
    @expected.subject = 'Mailer#password_reset_instructions'
    @expected.body    = read_fixture('password_reset_instructions')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Mailer.create_password_reset_instructions(@expected.date).encoded
  end

end
