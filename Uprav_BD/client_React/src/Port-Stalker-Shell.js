import React from 'react';
import axios from 'axios';
import config from './config.json';

class PortStalker extends React.Component{
    constructor(props){
        super(props)
        this.state={
            formMode: true,
            dataDevice: {},
        }
        this.ReturnInputIpForm = this.ReturnInputIpForm.bind(this)
        this.RequestPortStalker = this.RequestPortStalker.bind(this)
        this.AfterInput = this.AfterInput.bind(this)
        this.ResponseTable = this.ResponseTable.bind(this)

    }

    RequestPortStalker(){
        let inputIp = document.getElementById('InputFormIp').value
        
        axios.get(`${config.flask}/api/v1/PortStalker/`,{ params: {ip: inputIp}})
        .then((res)=>{
            this.setState({dataDevice:res.data, formMode: false})
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

    ReturnInputIpForm(){
        return(
            <div className="input-group col-md-6">
                <input className = "form-control" type="text" id="InputFormIp"/>
                <input type="button" className="btn btn-outline-secondary" value="Find it !" onClick={this.RequestPortStalker}/>
            </div>   
        );
    }

    ResponseTable(){
        if (this.state.dataDevice.header && this.state.dataDevice.request_rows){
            console.log(this.state.dataDevice.header.length);
            if (this.state.dataDevice.header.length !== 0){
                return(
                    <table className="col-md-6 table-striped">
                        <tbody>
                            <tr>
                                {Object.keys(this.state.dataDevice.header).map((head)=>{
                                            return(
                                                <th>{head}</th>
                                            )
                                        }
                                    )
                                }
                            </tr>
                            {Object.keys(this.state.dataDevice.request_rows).map((Row,RowData)=>{
                                            return(
                                                <td>{Row[RowData]}</td>
                                            )
                                        }
                                    )
                                }
                        </tbody>
                    </table>)
            } else {
                return (<h3>В MySql базе - не найден</h3>)
            }
        }  else {
            return '';
        }
    }

    AfterInput(){
        if (this.state.dataDevice.header || this.state.dataDevice.url_netbox){
            return(
                <div className="col-md-6">
                    <br/>
                    <table className="table-striped">
                        <tbody>
                            <tr>
                                <td>Device URL:</td>
                                <td><a href={this.state.dataDevice.url_netbox}>{this.state.dataDevice.url_netbox}</a></td>
                            </tr>
                                
                            <tr>
                                <td>Device Name : </td>
                                <td>{this.state.dataDevice.dev_name}</td>
                            </tr>
                            <tr>
                                <td>Device Model : </td>
                                <td>{this.state.dataDevice.dev_model}</td>
                            </tr>
                        </tbody>
                    </table>

                    <br/>
                        <this.ResponseTable/>
                    <br/>
                </div>
            )
        } else if (this.state.formMode){
            return (<div className="col-md-6"><h3>Введите IP-address устройства</h3></div>);
        } else {
            return (<div className="col-md-6"><h3>IP не найден</h3></div>);
        }
    }
    render(){
        return(
        <div className="container">
            <this.ReturnInputIpForm/>
            <this.AfterInput/>
        </div>
        );
    }

}

export default PortStalker