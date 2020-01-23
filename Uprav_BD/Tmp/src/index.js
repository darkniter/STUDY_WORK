import React from 'react';
import axios from 'axios';
import config from './config.json';
import ReactDOM from 'react-dom'

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
        this.SendRequestSQL = this.SendRequestSQL.bind(this)
        this.AuthReq = this.AuthReq.bind(this)
        this.ReturnInputForm = this.ReturnInputForm.bind(this)
    }

    SendRequestSQL(){

        let SQL_request =document.getElementById('InputFormSQL').value
        axios.get(`${config.flask}/`,{
        params: {user: this.state.Login, pass: this.state.Pass, staff: SQL_request}})
        .then((res)=>{
            if (res.data.access_restriction){}
            this.setState({Response:res.data, response_SQL: true})
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
    Logout(){
        this.setState({auth:false, Login:'', Pass: ''})
    }
    AuthReq(){
        let Pass_tmp = document.getElementById('InputFormPass').value
        let Login_tmp = document.getElementById('InputFormLogin').value
        axios.get(`${config.flask}/getUser/`,{
        params: {user: Login_tmp, pass: Pass_tmp, }})
        .then((res)=>{
            if (res.data.Access){
            this.setState({auth:res.data.Access, Login:Login_tmp, Pass: Pass_tmp})
        }   else{
                this.setState({auth:res.data.Access, Login:'', Pass: ''})
                }
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
        if (this.state.auth === false){
            return(
                
                <div className="container">
                   
                     <br/><p> LOGIN :</p><input className = "form-control" type="text" id="InputFormLogin"/>
                     <br/><p> PASSWORD :</p><input className = "form-control" type="text" id="InputFormPass"/>
                     <br/><input type="button" className="btn btn-outline-secondary" value="Log In" onClick={this.AuthReq}/>
                </div>   
            );
        }
        else if (this.state.response_SQL === false){
            return(
                <div className="container">
                     <br/><input type="button" className="btn btn-outline-secondary" value="Log out" onClick={this.Logout}/>
                     <div className="input-group col-md-9">
                        <br/><p> REQUEST : </p><input className = "form-control" type="text" id="InputFormSQL"/>
                        <br/><input type="button" className="btn btn-outline-secondary" value="Send to BD" onClick={this.SendRequestSQL}/>
                    </div>
                </div>   
            )
        }
        else if (this.state.Response.descript){
            return(
                
                <div className="container">
                    <br/>
                    <br/><input type="button" className="btn btn-outline-secondary" value="Log out" onClick={this.Logout}/>
                        <div className="input-group col-md-9">
                        <br/><p> REQUEST : </p> <input className = "form-control" type="text" id="InputFormSQL"/>
                        <br/>  <input type="button" className="btn btn-outline-secondary" value="Send to BD" onClick={this.SendRequestSQL}/>
                        </div>
                    <br/>
                    <br/>
                    <table className="col-md-9 table-striped">
                        <tbody>
                            <tr>
                                {Object.keys(this.state.Response.descript).map((Data)=>{
                                            return(
                                                <th>{this.state.Response.descript[Data]}</th>
                                            )
                                        }
                                    )
                                }
                            </tr>
                            {Object.keys(this.state.Response.SQL_resp).map((Row)=>{
                                            return(
                                                <tr>
                                                {this.state.Response.SQL_resp[Row].map((RowData)=>{
                                                return(
                                                    <td>{[RowData]}</td>)
                                                        }
                                                    )
                                                }
                                                </tr>
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
             <br/> <br/> <br/> <br/>
            <this.ReturnInputForm/>
        </div>
        );
    }

}

ReactDOM.render((
  <AuthForm/>),
  document.getElementById('root')
);