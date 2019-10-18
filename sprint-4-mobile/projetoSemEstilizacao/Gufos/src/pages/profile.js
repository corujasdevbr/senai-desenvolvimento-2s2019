import React, { Component } from 'react'
import { Text, AsyncStorage } from 'react-native'

class Profile extends Component {

    constructor(props) {
        super(props);
        this.state = {
            token: ''
        }
    }

    componentDidMount() {
        this._buscarDadosDoStorage();
    }

    _buscarDadosDoStorage = async () => {
        try {
            const tokenDoStorage = await AsyncStorage.getItem('@Gufos:token');
            if (tokenDoStorage != null) {
                this.setState({ token: tokenDoStorage })
            }
        } catch (error) {

        }
    }

    render() {
        return (
            <Text>{this.state.token}</Text>
        )
    }
}

export default Profile