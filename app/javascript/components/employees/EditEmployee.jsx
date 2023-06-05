import React from 'react'
import { useAsync } from 'react-async-hook';
import { useForm } from 'react-hook-form'
import { useNavigate, useParams } from 'react-router-dom';
import { InputInvalidMessage } from '../commons';

const fetchEmployee = async( id ) => {
    return (await fetch(`/api/v1/employees/${id}.json`)).json();
}

export const EditEmployee = () => {
    const { register, handleSubmit, getValues, formState: { errors } } = useForm();
    const { id } = useParams()
    const { loading, result=[] } = useAsync(fetchEmployee, [ id ])

    const navigate = useNavigate()

    const onSubmit = ()=>{
        const emp = {
            "employee":{
                name: getValues("name")
            }
        };
    
        fetch(`/api/v1/employees/${id}.json`, {
            method: "PATCH",
            body: JSON.stringify(emp),
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then(response => {
            if(response.status == 200){
                navigate("/employees")
            }
        })
    }

    return (
        <>
            {
                !loading &&
                (
                    <form onSubmit={ handleSubmit( onSubmit ) }>
                        <input defaultValue={ result.name }
                            autoComplete="off"
                            placeholder="Nombre"
                            className="form-control"
                            {...register("name", { required: true })} />
                        {
                            errors.name &&
                            <InputInvalidMessage
                            msg="Ingrese el nuevo nombre." />
                        }

                        <div className="d-flex justify-content-end">
                            <input type="submit"
                                className="btn btn-primary mt-2"
                                value="Actualizar" />
                        </div>
                    </form>
                )
            }
        </>
    )
}
