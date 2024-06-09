window.Post = Post;

let NewAllertCount = 0;
let Sound = true;
globalThis.Show = true;

export function NewPlayer(...players) {
    const Dispatch = document.querySelector('.Main .Dispatch');

    players.forEach(function (player) {
        if (player.PlayerList) {
            const NewPlayer = document.createElement('div');
            NewPlayer.className = 'Player';
            NewPlayer.setAttribute('id', 'PlayerList');

            NewPlayer.innerHTML = `
                <div class="Code">${player.Code}</div>
                <div class="Title">${player.Title}</div>
                <div class="Actions">
                    <i class="fa-solid fa-circle-xmark" onclick="Post({Type: 'Delete', Element: 'PlayerList'})"></i>
                </div>
            `;

            Dispatch.insertBefore(NewPlayer, Dispatch.firstChild.nextSibling);
        } else {
            const NewPlayer = document.createElement('div');
            NewPlayer.className = 'Player';
            NewPlayer.setAttribute('id', 'Player');

            NewPlayer.innerHTML = `
                <div class="Code">${player.Code}</div>
                <div class="Title">${player.Title}</div>
                <div class="Actions">
                    <i class="fa-solid fa-users" onclick="Post({Type: 'PlayerLists', Element: 'Player'})"></i>
                    <i class="fa-solid fa-tower-broadcast" onclick="Post({Type: 'PanicButtons', Element: 'Player'})"></i>
                </div>
            `;

            Dispatch.insertBefore(NewPlayer, Dispatch.firstChild);
        }
    });
}

export function NewAllert(...allerts) {
    const Dispatch = document.querySelector('.Main .Dispatch');

    allerts.forEach(function (allert) {

        const AllertLenght = Dispatch.querySelectorAll('.Allert').length;
        if (allert.MaxAllertsList && AllertLenght >= allert.MaxAllertsList) {
            return;
        }

        const NewAllert = document.createElement('div');
        NewAllert.className = 'Allert';
        NewAllert.setAttribute('id', `Allert${NewAllertCount}`);
        NewAllertCount++;

        const CurretTime = new Date();

        const Mp3 = new Audio('sound.mp3');

        NewAllert.innerHTML = `
            <div class="Code"> <i class="fa-solid fa-${allert.Icon}"></i> ${allert.Code}</div>
            <div class="Title">${allert.Title}</div>
            <div class="Description">
                <div>
                    <i class="fa-solid fa-map-location-dot"></i>
                    <p>${allert.Location}</p>
                </div>
                <div>
                    <i class="fa-solid fa-id-card"></i>
                    <p>${allert.Object}</p>
                </div>
                <div>
                    <i class="fa-solid fa-phone-volume"></i>
                    <p>${allert.Message}</p>
                </div>
            </div>
            <div class="Time" data-time="${CurretTime}">
                <i class="fa-solid fa-clock"></i>
                <p>${Time(CurretTime)}</p>
            </div>
            <div class="Actions">
                <i class="fa-solid fa-share" onclick="Post({Type: 'Response', Element: 'Allert${NewAllertCount - 1}', Data: {x: ${allert.Coords.x}, y: ${allert.Coords.y}, z: ${allert.Coords.z} } })"></i>
                <i class="fa-solid fa-circle-xmark" onclick="Post({Type: 'Delete', Element: 'Allert${NewAllertCount - 1}'})"></i>
            </div>
        `;

        if (allert.PanicButtons) {
            const NewAllertIcon = NewAllert.querySelector('.Code i');

            let Color = true;
            setInterval(() => {
                if (Color) {
                    NewAllertIcon.style.color = 'red';
                } else {
                    NewAllertIcon.style.color = 'blue';
                }
                Color = !Color;
            }, 650);

            const LastPlayer = document.querySelector('.Player');
            LastPlayer.insertAdjacentElement('afterend', NewAllert);
        } else {
            Dispatch.appendChild(NewAllert);
        }

        if (Sound ?? allert.Sound) {
            Mp3.play();
        } else {
            Mp3.pause();
            Mp3.currentTime = 0;
        }

        Scroll();
        setInterval(UpdateTime, 60000);
    });
}

export function ActionsAllert(type, ...args) {
    args.forEach(function (arg) {
        let Allert = null;
        let Player = null;

        if (arg.Element) {
            Allert = document.getElementById(arg.Element).closest('.Allert');
            Player = document.getElementById(arg.Element).closest('.Player');
        }
        const Allerts = document.querySelectorAll('.Allert');
        const Players = document.querySelectorAll('.Player');
        const Actions = document.querySelectorAll('.Action');

        if (type === 'Response') {
            if (Allert) {
                const AllertCode = Allert.querySelector('.Code');
                const AllertShare = Allert.querySelector('.fa-share');

                if (!AllertShare || !AllertShare.classList) {
                    return;
                }

                AllertShare.classList.remove('fa-share');
                AllertShare.classList.add('fa-check');

                AllertCode.addEventListener('mouseover', function () {
                    this.style.background = 'green';
                });

                AllertCode.addEventListener('mouseout', function () {
                    this.style.background = '';
                });
            }
        } else if (type === 'Delete') {
            if (Allert) {
                Allert.remove();
            } else if (Player) {
                Player.remove();
            }
        } else if (type === 'Clear') {
            setTimeout(() => {
                Allerts.forEach(function (Allert) {
                    Allert.parentNode.removeChild(Allert);
                });
            }, 500);
        } else if (type === 'PlayerLists') {
            setTimeout(() => {
                const PlayerHouse = Player.querySelector('.fa-house');

                if (Player && PlayerHouse) {
                    if (PlayerHouse) {
                        Players.forEach(function (player, index) {
                            if (index !== 0) {
                                player.remove();
                            }
                        });

                        PlayerHouse.classList.remove('fa-house');
                        PlayerHouse.classList.add('fa-users');
                    }
                } else {
                    if (Player) {
                        const PlayerUsers = Player.querySelector('.fa-users');

                        PlayerUsers.classList.remove('fa-users');
                        PlayerUsers.classList.add('fa-house');
                    }

                    Allerts.forEach(function (Allert) {
                        Allert.parentNode.removeChild(Allert);
                    });

                    setTimeout(() => {
                        const player = arg.PlayerLists
                        player.forEach(function (players) {
                            NewPlayer(players);
                        });
                    }, 50);
                }
            }, 500);
        } else if (type === 'PanicButtons') {
            NewAllert(arg.PanicButtons);
        } else if (type === 'Reload') {
            Actions.forEach(function (Action) {
                const ReloadIcon = Action.querySelector('.Reload i');

                Allerts.forEach(function (Allert) {
                    const AllertCheckIcon = Allert.querySelector('.fa-check');

                    if (AllertCheckIcon) {
                        ReloadIcon.classList.remove('fa-rotate-right');
                        ReloadIcon.classList.add('fa-rotate');

                        ReloadIcon.style.transition = 'transform 1s ease-in-out';
                        ReloadIcon.style.transform = 'rotate(360deg)';
                        Allert.remove();

                        setTimeout(function () {
                            ReloadIcon.classList.remove('fa-rotate');
                            ReloadIcon.classList.add('fa-rotate-right');
                            ReloadIcon.style.transition = 'transform 1s ease-in-out';
                            ReloadIcon.style.transform = 'rotate(0deg)';
                        }, 1000);
                    }
                });

            });
        } else if (type === 'Show') {
            Actions.forEach(function (Action) {
                const ShowIcon = Action.querySelector('.Show i');

                if (globalThis.Show) {
                    globalThis.Show = false;

                    ShowIcon.classList.remove('fa-eye');
                    ShowIcon.classList.add('fa-eye-slash');
                } else {
                    globalThis.Show = true;

                    ShowIcon.classList.remove('fa-eye-slash');
                    ShowIcon.classList.add('fa-eye');
                }
            });
        } else if (type === 'Sound') {
            Actions.forEach(function (Action) {
                const SoundIcon = Action.querySelector('.Sound i');

                if (Sound) {
                    Sound = false;

                    SoundIcon.classList.remove('fa-volume-high');
                    SoundIcon.classList.add('fa-volume-xmark');
                } else {
                    Sound = true;

                    SoundIcon.classList.remove('fa-volume-xmark');
                    SoundIcon.classList.add('fa-volume-high');
                }
            });
        }
    });
}

function Post(args) {
    const url = `https://${GetParentResourceName()}/Zoxe_Dispatch:Post`;
    $.post(url, JSON.stringify(args), function (response) {
        console.log('Machine Success:', response);
    }).fail(function (error) {
        console.error('Machine Error:', error);
    });
}

function Time(args) {
    const NewDate = new Date();
    const OldDate = new Date(args);
    const Difference = NewDate - OldDate;

    if (Difference < 60000) {
        return 'Just Now';
    } else if (Difference < 3600000) {
        const MDifference = Math.floor(Difference / 60000);
        return `${MDifference} Minute${MDifference !== 1 ? 's' : ''} Ago`;
    } else if (Difference < 86400000) {
        const HDifference = Math.floor(Difference / 3600000);
        return `${HDifference} Hour${HDifference !== 1 ? 's' : ''} Ago`;
    } else {
        return args;
    }
}

function UpdateTime() {
    const AllertTimes = document.querySelectorAll('.Time');
    AllertTimes.forEach(function (AllertTime) {
        const OldTime = new Date(AllertTime.dataset.time);
        AllertTime.querySelector('p').textContent = Time(OldTime);
    });
}

function Scroll() {
    const Dispatch = document.querySelector('.Main .Dispatch');
    const Player = document.querySelector('.Dispatch .Player');

    if (Dispatch && Player) {
        let isScrolling = false;
        let scrollTimeout;

        function Scrolling() {
            isScrolling = true;
            if (Player.style.marginTop === '1.25rem') {
                Dispatch.style.top = '8rem';
                Player.style.marginTop = '0';
            }

            clearTimeout(scrollTimeout);

            scrollTimeout = setTimeout(() => {
                isScrolling = false;
                if (!isScrolling) {
                    if (Dispatch.scrollTop === 0) {
                        Dispatch.style.top = '7rem';
                    }

                    Player.style.marginTop = '1.25rem';
                }
            }, 100);
        }

        Dispatch.addEventListener('scroll', Scrolling);
    }
}

// setInterval(() => {
//     NewAllert({
//         Code: '10-80',
//         Title: 'Emergency Request',
//         Icon: 'bullhorn',
//         Location: 'Losantos Avenue',
//         Object: 'Harvery Walker | +1 (555) 123-4567',
//         Message: 'Requesting Emergency',
//         Time: 'Just Now',
//     });
// }, 5 * 1500);
