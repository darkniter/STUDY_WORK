import React from 'react';
import axios from 'axios';
import config from './config.json';

class AuthForm extends React.Component {
    constructor(props){

        super(props)

        this.state = {
            auth: false,
            response_SQL: false,
            SQL_request: '',
            Login: '',
            Pass: '',
            Response: [],
        }
    }

    SendRequestSQL(){

        let SQL_request = document.getElementById('InputFormInputFormSQL').value
        axios.get(`${config.flask}/getUser/`,{
        params: {user: Login_tmp, pass: this.Pass_tmp, staff: SQL_request}})
        .then((res)=>{
            this.setState({Response:res.data, SQL_request: SQL_request})
        })
        .catch((error) => {
            // if (typeof error.response.data == 'string'){
            //     alert(error.response.data)
            //   } else{
            //       for (let item in error.response.data){
            //         alert(error.response.data[item]);
            //       }}
            console.error(error);
          });
    }

    AuthReq(){
        let Pass_tmp = document.getElementById('InputFormPass').value
        let Login_tmp = document.getElementById('InputFormLogin').value
        axios.get(`${config.flask}/getUser/`,{
        params: {user: this.state.Login, pass: this.state.Pass, }})
        .then((res)=>{
            this.setState({auth:res.data, Login:Login_tmp, Pass: Pass_tmp})
        })
        .catch((error) => {
            // if (typeof error.response.data == 'string'){
            //     alert(error.response.data)
            //   } else{
            //       for (let item in error.response.data){
            //         alert(error.response.data[item]);
            //       }}
            console.error(error);
          });
    }

    ReturnInputForm(){
        if (this.state.auth == false){
            return(
                <div className="input-group col-md-6">
                    <input className = "form-control" type="text" id="InputFormLogin"/>
                    <input className = "form-control" type="text" id="InputFormPass"/>
                    <input type="button" className="btn btn-outline-secondary" value="Log In" onClick={this.AuthReq}/>
                </div>   
            );
        }
        else if (this.state.response_SQL == false){
            return(
                <div className="input-group col-md-6">
                    <input className = "form-control" type="text" id="InputFormSQL"/>
                    <input type="button" className="btn btn-outline-secondary" value="Send to BD" onClick={this.SendRequestSQL}/>
                </div>   
            )
        }
        else if (this.state.Response.descript){
            return(
                
                <div className="col-md-6">
                    <br/>
                        <div className="input-group col-md-6">
                            <input className = "form-control" type="text" id="InputFormSQL"/>
                            <input type="button" className="btn btn-outline-secondary" value="Send to BD" onClick={this.SendRequestSQL}/>
                        </div>
                    <br/>
                    <br/>
                    <table className="col-md-6 table-striped">
                        <tbody>
                            <tr>
                                {Object.keys(this.state.Response.descript).map((head)=>{
                                            return(
                                                <th>{head}</th>
                                            )
                                        }
                                    )
                                }
                            </tr>
                            {Object.keys(this.state.Response.SQL_resp).map((Row,RowData)=>{
                                            return(
                                                <td>{Row[RowData]}</td>
                                            )
                                        }
                                    )
                                }
                        </tbody>
                    </table>

                </div>
            )
        }
       
    }
    render(){
        return(
        <div className="container">
            <this.ReturnInputForm/>
        </div>
        );
    }

}