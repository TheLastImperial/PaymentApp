import React from 'react'

const { createBrowserRouter } = require("react-router-dom");

import { App } from "../components/App";
import { Employees, EditEmployee, NewEmployee } from '../components/employees/index.js';
import { Roles, NewRole, EditRole } from '../components/roles';
import { NewSalaryDetail, SalaryDetails } from '../components/salary_details';
import { Payslips, NewPayslip, Payslip } from '../components/payslips';

export const router = createBrowserRouter([
    {
        path: "/",
        element: <App/>,
        children: [
            {
                path: "/employees",
                element: <Employees/>
            },
            {
                path: "/employees/edit/:id",
                element: <EditEmployee/>
            },
            {
                path: "/employees/new",
                element: <NewEmployee/>
            },
            {
                path: "/roles",
                element: <Roles/>
            },
            {
                path: "/roles/new",
                element: <NewRole/>
            },
            {
                path: "/roles/edit/:id",
                element: <EditRole/>
            },
            {
                path: "/salary_details",
                element: <SalaryDetails/>
            },
            {
                path: "salary_details/new",
                element: <NewSalaryDetail/>
            },
            {
                path: "/payslips",
                element: <Payslips/>
            },
            {
                path: "/payslips/new/:id",
                element: <NewPayslip/>
            },
            {
                path: "/payslips/:id",
                element: <Payslip/>
            },
            {
                path: "/",
                element: <Employees/>
            },
        ],
    },
]);