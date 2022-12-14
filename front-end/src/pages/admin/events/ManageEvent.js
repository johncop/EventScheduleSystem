import Sidebar from '../../../components/layout/sidebar/Sidebar';
import '../../../App.scss';
import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import {
    InputLabel,
    Table,
    TableBody,
    TableCell,
    TableContainer,
    TableHead,
    TableRow,
    TextField,
} from '@mui/material';
import Paper from '@mui/material/Paper';
import Button from '@mui/material/Button';
import { useAdminEvents } from '../../../recoil/adminEvents';
import { useSnackbar } from '../../../HOCs';
import AlertConfirm from '../../../components/ConfirmDialog';
import authAtom from '../../../recoil/auth/atom';
import { useRecoilValue } from 'recoil';

const ManageEvents = () => {
    const [events, setEvents] = useState([]);
    const showSackbar = useSnackbar();
    const { getEvents, deleteEvent, searchEvent, getHostEvents } = useAdminEvents();
    const [name, setName] = useState('');
    const [openDialog, setOpenDialog] = useState(false);
    const [eventId, setEventId] = useState(-1);
    const [hostedEvents, setHostedEvents] = useState([])
    const auth = useRecoilValue(authAtom);

    const openDiaglogHandler = (eventId) => {
        setOpenDialog(true);
        setEventId(eventId);
    };

    const closeDialogHanlder = () => {
        setOpenDialog(false);
        setEventId(-1);
    };

    function deleteItem(id) {
        deleteEvent(id)
            .then((resposne) => {
                const deletedArray = events.filter(
                    (event) => event.event_id !== id,
                );
                setEvents(deletedArray);
                showSackbar({
                    severity: 'success',
                    children: resposne.data,
                });
            })
            .catch(() => {
                showSackbar({
                    severity: 'error',
                    children: 'Something went wrong, please try again later.',
                });
            });
    }

    const eventNameHandler = (event) => {
        setName(event.target.value);
    };

    function searchEventlist(name) {
        searchEvent(name)
            .then((resposne) => {
                const data = resposne.data.data;
                setEvents(data);
            })
            .catch((error) => {
                showSackbar({
                    severity: 'error',
                    children: 'Something went wrong, please try again later.',
                });
            });
    }

    useEffect(() => {
        getEvents()
            .then((resposne) => {
                const data = resposne.data.data;
                setEvents(data);
            })
            .catch(() => {
                showSackbar({
                    severity: 'error',
                    children: 'Something went wrong, please try again later.',
                });
            });
        getHostEvents(auth.userId).then(response => {
            const data = response.data.data
            if(data !== null) {
                setHostedEvents(data)
            }else{
                alert("B???n ch??a t???o s??? ki??n n???o, vui l??ng t???o s??? ki???n m???i.")
            }
        }).catch(error => {
            console.log(error.response);
        })

    }, []);

    return (
        <div className="flex">
            <Sidebar />
            <TableContainer component={Paper} sx={{ maxWidth: 980 }}>
                <InputLabel
                    sx={{ paddingLeft: 2, paddingTop: 2 }}
                    className="adminLabel"
                >
                    Nh???p t??n s??? ki???n c???n t??m ??? ????y ...
                </InputLabel>
                <TextField
                    sx={{ padding: 2 }}
                    id="filled-basic"
                    variant="filled"
                    onChange={eventNameHandler}
                    onKeyPress={(event) => {
                        if (event.key === 'Enter') {
                            searchEventlist(name);
                        }
                    }}
                    fullWidth
                />
                <Table
                    sx={{ minWidth: 650, marginTop: 2 }}
                    aria-label="event list"
                >
                    <TableHead>
                        <TableRow>
                            <TableCell>T??n s??? ki???n</TableCell>
                            <TableCell align="center">Ng?????i tham gia</TableCell>
                            <TableCell align="center">Chi ti???t</TableCell>
                            <TableCell align="center">C???p nh???t</TableCell>
                            <TableCell align="center">X??a</TableCell>
                        </TableRow>
                    </TableHead>
                    <TableBody>
                        {auth.role === 'admin' ? events.map((event) => (
                            <TableRow
                                key={event?.event_id}
                                sx={{
                                    '&:last-child td, &:last-child th': {
                                        border: 0,
                                    },
                                }}
                            >
                                <TableCell component="th" scope="row">
                                    {event?.event_name}
                                </TableCell>
                                <TableCell align="center">
                                    <Link
                                        to={`/admin/manage/participated/${event.event_id}`}
                                    >
                                        <Button variant="contained">
                                            Danh s??ch
                                        </Button>
                                    </Link>
                                </TableCell>
                                <TableCell align="center">
                                    <Link
                                        to={`/admin/manage/eventdetail/${event.event_id}`}
                                    >
                                        <Button variant="contained">Xem</Button>
                                    </Link>
                                </TableCell>
                                <TableCell align="center">
                                    <Link
                                        to={`/admin/manage/update/${event.event_id}`}
                                    >
                                        <Button variant="contained">
                                            C???p nh???t
                                        </Button>
                                    </Link>
                                </TableCell>
                                <TableCell align="center">
                                    <Button
                                        onClick={(e) =>
                                            openDiaglogHandler(event.event_id)
                                        }
                                        variant="contained"
                                    >
                                        X??a
                                    </Button>
                                </TableCell>
                            </TableRow>
                        )) : hostedEvents.map(event => (
                            <TableRow
                                key={event?.event_id}
                                sx={{
                                    '&:last-child td, &:last-child th': {
                                        border: 0,
                                    },
                                }}
                            >
                                <TableCell component="th" scope="row">     
                                    {event?.event_name}
                                </TableCell>
                                <TableCell align="center">
                                    <Link
                                        to={`/admin/manage/participated/${event.event_id}`}
                                    >
                                        <Button variant="contained">
                                            Danh s??ch
                                        </Button>
                                    </Link>
                                </TableCell>
                                <TableCell align="center">
                                    <Link
                                        to={`/admin/manage/eventdetail/${event.event_id}`}
                                    >
                                        <Button variant="contained">Xem</Button>
                                    </Link>
                                </TableCell>
                                <TableCell align="center">
                                    <Link
                                        to={`/admin/manage/update/${event.event_id}`}
                                    >
                                        <Button variant="contained">
                                            C???p nh???t
                                        </Button>
                                    </Link>
                                </TableCell>
                                <TableCell align="center">
                                    <Button
                                        onClick={(e) =>
                                            openDiaglogHandler(event.event_id)
                                        }
                                        variant="contained"
                                    >
                                        X??a
                                    </Button>
                                </TableCell>
                            </TableRow>
                        ))}
                    </TableBody>
                </Table>
            </TableContainer>
            <AlertConfirm
                title={'X??a event'}
                children={'B???n c?? ch???c ch???n x??a event n??y kh??ng?'}
                onClose={closeDialogHanlder}
                onConfirm={() => deleteItem(eventId)}
                open={openDialog}
                btnConfirmText={'X??a'}
            />
        </div>
    );
};

export default ManageEvents;
