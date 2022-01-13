import { readFile } from "fs/promises";
import { JsonWebTokenError, sign, verify } from "jsonwebtoken"

export const secret = await readFile("/secrets/jwt");

export const signAccount = (id: number): string => {
    return sign(
        { id },
        secret,
        {
            algorithm: "HS256",
            issuer: "authn",
            expiresIn: "1 day",
        }
    );
};

export const verifyAccount = (token: string): number | null => {
    try {
        const { id } = verify(
            token,
            secret,
            {
                algorithms: ["HS256"],
                issuer: "authn",
                maxAge: "1 day",
            }
        );

        return id;
    } catch (e) {
        if (e instanceof JsonWebTokenError) {
            return null;
        } else {
            throw e;
        }
    }
}
