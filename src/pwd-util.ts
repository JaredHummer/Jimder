import { argon2id, hash, verify } from "argon2";

export const hashPassword = async (password: string): Promise<string | null> => {
    // if (!/^.{3,}$/.test(password)
    //     || !/[a-z]/.test(password)
    //     || !/[A-Z]/.test(password)
    //     || !/[0-9]/.test(password)) {
    //     return null;
    // }

    return await hash(password, {
        type: argon2id,
        timeCost: 5,
        memoryCost: 256 * 1024,
    });
}

export const verifyPassword = async (password: string, passwordHash: string) => {
    return await verify(passwordHash, password);
}
