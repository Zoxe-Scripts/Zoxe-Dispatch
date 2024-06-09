import { NewPlayer, NewAllert, ActionsAllert } from './script.js';

window.addEventListener('message', function (event) {
    if (event.data.type === 'Zoxe_Dispatch:Open') {
        setTimeout(() => {
            document.querySelector('.Main').style.transition = 'opacity 0.5s ease';
            document.querySelector('.Main').style.opacity = '1';
        }, 100);
    } else if (event.data.type === 'Zoxe_Dispatch:Close') {
        setTimeout(() => {
            document.querySelector('.Main').style.transition = 'opacity 0.5s ease';
            document.querySelector('.Main').style.opacity = '0';
        }, 100);
    } else if (event.data.type === 'Zoxe_Dispatch:Response') {
        const arg = event.data.data;
        ActionsAllert('Response', arg);
    } else if (event.data.type === 'Zoxe_Dispatch:Delete') {
        const arg = event.data.data;
        ActionsAllert('Delete', arg);
    } else if (event.data.type === 'Zoxe_Dispatch:Clear') {
        ActionsAllert('Clear', '')
    } else if (event.data.type === 'Zoxe_Dispatch:PlayerLists') {
        const arg = event.data.data;
        ActionsAllert('PlayerLists', arg);
    } else if (event.data.type === 'Zoxe_Dispatch:PanicButtons') {
        const arg = event.data.data;
        ActionsAllert('PanicButtons', arg);
    } else if (event.data.type === 'Zoxe_Dispatch:NewPlayer') {
        NewPlayer(event.data.data.NewPlayer)
    } else if (event.data.type === 'Zoxe_Dispatch:NewAllert') {
        if (Show) {
            document.querySelector('.Main').style.transition = 'opacity 0.5s ease';
            document.querySelector('.Main').style.opacity = '1';

            setTimeout(() => {
                NewAllert(event.data.data.NewAllert)
            }, 50);

            setTimeout(() => {
                document.querySelector('.Main').style.transition = 'opacity 0.5s ease';
                document.querySelector('.Main').style.opacity = '0';
                $.post(`https://${GetParentResourceName()}/Zoxe_Dispatch:Close`, JSON.stringify({}));
            }, event.data.data.NewAllert.AllertShow * 1000);
        } else {
            NewAllert(event.data.data.NewAllert)
            $.post(`https://${GetParentResourceName()}/Zoxe_Dispatch:Close`, JSON.stringify({}));
        }
    } else if (event.data.type === 'Zoxe_Dispatch:Reload') {
        ActionsAllert('Reload', '');
    } else if (event.data.type === 'Zoxe_Dispatch:Show') {
        ActionsAllert('Show', '');
    } else if (event.data.type === 'Zoxe_Dispatch:Sound') {
        ActionsAllert('Sound', '');
    }
});

document.onkeydown = function (event) {
    event = event || window.event;
    if (event.keyCode === 27) {
        $.post(`https://${GetParentResourceName()}/Zoxe_Dispatch:Close`, JSON.stringify({}));

        setTimeout(() => {
            document.querySelector('.Main').style.opacity = '0';
        }, 100);
    }
};