import React from 'react'
import { useNavigate } from 'react-router-dom'

export const EmployeeItem = ({id, name, refetch}) => {
    const navigate = useNavigate()
    
    const onDelete = () => {
        fetch(`/api/v1/employees/${id}.json`, {
            method: "DELETE",
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then(response => {
            if(response.status == 204){
                refetch()
                navigate("/employees")
            }
        })
    }

    const onEdit = () => {
        navigate( `/employees/edit/${ id }` )
    }
    const onPayslip = ()=> {
        navigate(`/payslips/new/${ id }`)
    }
    return (
        <>
            <li className="list-group-item d-flex justify-content-between">
                <span className="align-self-center">
                    { `${id} ${name}` }
                </span>
                <div>
                    <button type="button"
                        onClick={ onDelete }
                        className="btn btn-danger mr-2">
                        Eliminar
                    </button>
                    <button type="button"
                        onClick={ onEdit }
                        className="btn btn-primary mx-2">
                        Editar
                    </button>
                    <button type="button"
                        onClick={ onPayslip }
                        className="btn btn-success">
                        Generar nomina
                    </button>
                </div>
            </li>
        </>
    )
}
