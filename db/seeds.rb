# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Role.create!([
    { name: "Chofer" },
    { name: "Cargador" },
    { name: "Auxiliar" }
])

Employee.create!([
    { name: "Juan", role_id: 1},
    { name: "Pedro", role_id: 2},
    { name: "Flor", role_id: 3}
])

SalaryDetail.create!([
    {
        name: "Pago por hora",
        value: 30,
        conditional_value: 0,
        is_quantity: true,
        is_discount: false,
        is_main: true,
    },
    {
        name: "Bono por entrega",
        value: 5,
        conditional_value: 0,
        is_quantity: true,
        is_discount: false,
        is_main: false,
    },
    {
        name: "Hora extra chofer",
        value: 10,
        conditional_value: 192,
        is_quantity: true,
        is_discount: false,
        is_main: false,
        role_id: 1
    },
    {
        name: "Hora extra cargador",
        value: 5,
        conditional_value: 192,
        is_quantity: true,
        is_discount: false,
        is_main: false,
        role_id: 2
    },
    {
        name: "Vale de despensa",
        value: 4,
        conditional_value: 0,
        is_quantity: false,
        is_discount: false,
        is_main: false,
    },
    {
        name: "ISR",
        value: 9,
        conditional_value: 0,
        is_quantity: false,
        is_discount: true,
        is_main: false,
    },
    {
        name: "ISR Extra",
        value: 3,
        conditional_value: 10000,
        is_quantity: false,
        is_discount: true,
        is_main: false,
    },
])