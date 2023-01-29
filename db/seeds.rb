# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: 'testadmin@mail.com',
    password: 'testadmin',
    employee_number: '1',
    first_name: 'テスト',
    last_name: '管理者',
    is_deleted: 'false',
)

Staff.create!(
    email: 'teststaff@mail.com',
    password: 'teststaff',
    employee_number: '1',
    first_name: 'テスト',
    last_name: 'スタッフ',
    is_deleted: 'false',
    position: '1',
)
