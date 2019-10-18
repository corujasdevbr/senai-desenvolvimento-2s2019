import React, { Component } from 'react'
import { Text, TextInput, View, TouchableOpacity, AsyncStorage } from 'react-native'

class SignIn extends Component {
    constructor(props) {
        super(props);
        this.state = {
            email: null, senha: null
        }
    }

    _realizarLogin = async () => {
        console.warn(this.state.email + this.state.senha)
        fetch('http://192.168.7.85:5000/api/login', {
            method: 'POST',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                email: this.state.email,
                senha: this.state.senha
            })
        })
            .then(resposta => resposta.json())
            // .then(data => console.warn(data.token))
            .then(data => this._irParaHome(data.token))
            .catch(erro => console.warn(erro))
    }

    _irParaHome = async (token) => {
        if (token != null) {
            try {
                await AsyncStorage.setItem('@Gufos:token', token);
                this.props.navigation.navigate('MainNavigator');
            } catch (error) {

            }
        }
    }

    render() {
        return (
            <View>
                <TextInput
                    placeholder="email"
                    onChangeText={email => this.setState({ email })}
                />
                <TextInput
                    placeholder="senha"
                    onChangeText={senha => this.setState({ senha })}
                />
                <TouchableOpacity
                    onPress={this._realizarLogin}
                >
                    <Text>Login</Text>
                </TouchableOpacity>
            </View>
        )
    }
}

export default SignIn