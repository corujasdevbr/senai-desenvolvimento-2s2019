import { createAppContainer } from 'react-navigation';
import { createBottomTabNavigator } from 'react-navigation-tabs'

// Screens
import MedicosScreen from './pages/medicos'
import EspecialidadesScreen from './pages/especialidades'


const MainNavigator = createBottomTabNavigator(
    {
        Medicos: {
            screen: MedicosScreen
        },
        Especialidades: {
            screen: EspecialidadesScreen
        }
    }, {
    initialRouteName: 'Medicos',
    swipeEnabled: false,
    tabBarOptions: {
        showIcon: true,
        showLabel: true,
        inactiveTintColor: "#ffbaba",
        activeTintColor: "#ff5555",
    }
});

export default createAppContainer(MainNavigator)