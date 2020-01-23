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
            Login: false,
            Pass: false,
            Response: [],
        }
        this.SendRequestSQL = this.SendRequestSQL.bind(this)
        this.AuthReq = this.AuthReq.bind(this)
        this.ReturnInputForm = this.ReturnInputForm.bind(this)
        this.Logout = this.Logout.bind(this)
    }

    SendRequestSQL(){

        let SQL_request = document.getElementById('InputFormSQL').value
        if (SQL_request.toLowerCase().indexOf('drop table') !==-1 ){
            alert('Обнаружен опасный запрос, вы уверенны?')
        }
        axios.get(`${config.flask}/`,{
        params: {user: this.state.Login, pass: this.state.Pass, staff: SQL_request}})
        .then((res)=>{

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
        this.setState({auth:false, Login: false, Pass: false})
    }

    AuthReq(){
        let Pass_tmp = document.getElementById('InputFormPass').value
        let Login_tmp = document.getElementById('InputFormLogin').value
        if (Login_tmp && Pass_tmp){
            axios.get(`${config.flask}/getUser/`,{
            params: {user: Login_tmp, pass: Pass_tmp, }})
            .then((res)=>{
                this.setState({auth:res.data.Access, Login:Login_tmp, Pass: Pass_tmp})
            
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
        } else (
            this.setState({auth:false, Login:'-', Pass: '-'})
        )
    }

    ReturnInputForm(){
        if (this.state.auth === false && this.state.Login && this.state.Pass){
            return(
            <div className="container">       
            <br/><p> LOGIN :</p><input className = "form-control" type="text" id="InputFormLogin"/>
            <br/><p> PASSWORD :</p><input className = "form-control" type="text" id="InputFormPass"/>
            <br/><input type="button" className="btn btn-outline-secondary" value="Log In" onClick={this.AuthReq}/>
            <h4>FAILED TRY</h4>
            </div>   ); 
        }
        else if (this.state.auth === false && this.state.Pass===false){
            return(
                
                <div className="container">
                   
                     <br/><p> LOGIN :</p><input className = "form-control" type="text" id="InputFormLogin"/>
                     <br/><p> PASSWORD :</p><input className = "form-control" type="text" id="InputFormPass"/>
                     <br/><input type="button" className="btn btn-outline-secondary" value="Log In" onClick={this.AuthReq}/>
                </div>   
            );
        }
        else if (this.state.auth && this.state.response_SQL === false){
            return(
                <div className="container">
                     
                     <div className="input-group col-md-9">
                        <br/><p> REQUEST : </p><input className = "form-control" type="text" id="InputFormSQL"/>
                        <br/><input type="button" className="btn btn-outline-secondary" value="Send to BD" onClick={this.SendRequestSQL}/>
                    </div>
                    <br/><input type="button" className="btn btn-outline-secondary" value="Log out" onClick={this.Logout}/>
                </div>   
            )
        }
        else if (this.state.Response.descript){
            return(
                
                <div className="container">
                    <br/>
                    
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
                    <br/><input type="button" className="btn btn-outline-secondary" value="Log out" onClick={this.Logout}/>
                </div>
            )
        }
        else if (this.state.Response.access_restriction){
            return(
                <div className="container">
                    <br/>
                    
                        <div className="input-group col-md-9">
                        <br/><p> REQUEST : </p> <input className = "form-control" type="text" id="InputFormSQL"/>
                        <br/>  <input type="button" className="btn btn-outline-secondary" value="Send to BD" onClick={this.SendRequestSQL}/>
                        </div>
                        <br/>
                <br/>
                <div className="container">
                    <h3>{this.state.Response.access_restriction}</h3>
                    <br/>
                    <br/><input type="button" className="btn btn-outline-secondary" value="Log out" onClick={this.Logout}/>
                </div>
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