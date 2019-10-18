import React, { Component } from 'react'
import { Text, View } from 'react-native'
import { FlatList } from 'react-native-gesture-handler';

class Main extends Component {

    constructor(props) {
        super(props);
        this.state = {
            eventos: [
                // { idEvento: 1, titulo: 'Evento A', dataEvento: '2019-06-17T14:00:00.000' },
                // { idEvento: 2, titulo: 'Evento B', dataEvento: '2019-06-17T14:00:00.000' },
                // { idEvento: 3, titulo: 'Evento C', dataEvento: '2019-06-17T14:00:00.000' }
            ]
        }
    }

    componentDidMount() {
        this.carregarEventos();
    }

    carregarEventos = async () =>  {
        await fetch('http://192.168.7.85:5000/api/eventos')
            .then(resposta => resposta.json())
            .then(data => this.setState({ eventos: data }))
            .catch(erro => console.warn(erro))
    }

    render() {
        return (
            <FlatList
                data={this.state.eventos}
                keyExtractor={item => item.idEvento}
                renderItem={({ item }) => (
                    <View>
                        <Text>{item.titulo}</Text>
                        <Text>{item.dataEvento}</Text>
                    </View>
                )}
            />
        )
    }
}

export default Main