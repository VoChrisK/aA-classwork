export const signup = aUser => {
    return $.ajax({
        method: "POST",
        url: "/api/users",
        data: {
            user: {
                username: aUser.username,
                password: aUser.password
            }
        }
    });
};

export const login = aUser => {
    return $.ajax({
        method: "POST",
        url: "/api/session",
        data: {
            user: {
                username: aUser.username,
                password: aUser.password
            }
        }
    })
};

export const logout = () => {
    return $.ajax({
        method: "DELETE",
        url: "/api/session"
    })
};