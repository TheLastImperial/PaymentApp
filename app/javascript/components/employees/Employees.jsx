import React, { useEffect } from 'react'
import { EmployeeItem } from './EmployeeItem'
import { useAsync } from 'react-async-hook'
import { useNavigate } from 'react-router-dom'

const fetchEmployees = async( ) => {
  return (await fetch(`/api/v1/employees.json`)).json();
}

export const Employees = () => {
  const { loading, result, execute } = useAsync(fetchEmployees, []);
  const navigate = useNavigate();

  return (
    <>
      <div className="mb-2 d-flex justify-content-end">
        <button type="button"
          onClick={ () => navigate("/employees/new", {state: { refetch: execute}}) }
          className="btn btn-primary">
          Nuevo empleado
        </button>
      </div>
      {
        !loading &&
        (
          <div className="pt-6">
            <ul className="list-group">
              {
                result.map(employee => (
                  <EmployeeItem key={ employee.id }
                    id={ employee.id }
                    name={employee.name}
                    refetch={ execute }
                  />
                ))
              }
            </ul>
          </div>
        )
      }
    </>
  )
}
