"use client";
import dynamic from "next/dynamic";
import { useEffect, useState } from "react";

// Declare the token as an empty string initially
var token = '';

const VideoCallPage = () => {
  const [isWindowDefined, setIsWindowDefined] = useState(false);
  const [videoCall, setVideoCall] = useState(false);
  const [selectedUser, setSelectedUser] = useState(null);

  useEffect(() => {
    setIsWindowDefined(typeof window !== "undefined");
  }, []);

  const callbacks = {
    EndCall: () => setVideoCall(false),
  };

  const AgoraUIKit = dynamic(() => import("agora-react-uikit"), {
    ssr: false,
  });

  const users = [
    {
      avatar: "https://images.unsplash.com/photo-1511485977113-f34c92461ad9?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ",
      name: "Liam James",
      email: "liamjames@example.com",
      appointmentId: 1,
    },
    {
      avatar: "https://randomuser.me/api/portraits/men/86.jpg",
      name: "Olivia Emma",
      email: "oliviaemma@example.com",
      appointmentId: 2,
    },
    {
      avatar: "https://randomuser.me/api/portraits/women/79.jpg",
      name: "William Benjamin",
      email: "william.benjamin@example.com",
      appointmentId: 3,
    },
    {
      avatar: "https://api.uifaces.co/our-content/donated/xZ4wg2Xj.jpg",
      name: "Henry Theodore",
      email: "henrytheodore@example.com",
      appointmentId: 4,
    },
    {
      avatar: "https://images.unsplash.com/photo-1439911767590-c724b615299d?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ",
      name: "Amelia Elijah",
      email: "amelia.elijah@example.com",
      appointmentId: 5,
    },
  ];

  // Fetch the token for the selected user's appointment
  async function fetchAppointmentToken(appointmentId) {
    try {
      const response = await fetch(`https://mindcare-apis.onrender.com/api/appointments/1`);
      const data = await response.json();
      token = data.payload[0].appointment_token;
      return token;
    } catch (error) {
      console.error("Error:", error);
    }
  }

  const handleJoinCall = async (appointmentId) => {
    // Fetch the token for the selected appointment
    const fetchedToken = await fetchAppointmentToken(appointmentId);
    if (fetchedToken) {
      setSelectedUser(appointmentId);
      setVideoCall(true);
    }
  };

  const rtcProps = {
    appId: "be5fc8ece3f94175882bc161f0db11dc", // replace with your actual appId
    channel: `Appointment2`, // Dynamic channel based on selected user
    token: token,
  };

  return isWindowDefined ? (
    // <div className="flex justify-center items-center min-h-screen bg-gray-100">
    <div>
      {videoCall ? (
        <div style={{ display: "flex", justifyContent: "center", height: "90vh" }}>
          {/* Video call interface */}
          <AgoraUIKit rtcProps={rtcProps} callbacks={callbacks} />
        </div>
      ) : (
        <div>
          <div className="p-4">
            <h2 className="text-xl font-semibold mb-4">Available Users</h2>
            <table className="table-auto w-full text-left">
              <thead>
                <tr className="bg-gray-200">
                  <th className="px-4 py-2">Avatar</th>
                  <th className="px-4 py-2">Name</th>
                  <th className="px-4 py-2"></th>
                </tr>
              </thead>
              <tbody>
                {users.map((user, idx) => (
                  <tr key={idx} className="border-t">
                    <td className="px-4 py-2">
                      <img src={user.avatar} className="w-10 h-10 rounded-full" />
                    </td>
                    <td className="px-4 py-2">{user.name}</td>
                    <td className="px-4 py-2 text-right">
                      <button
                        onClick={() => handleJoinCall(user.appointmentId)}
                        className="px-3 py-2 bg-blue-500 text-white rounded-md hover:bg-blue-600"
                      >
                        Join
                      </button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      )}
    </div>
  ) : null;
};

export default VideoCallPage;
