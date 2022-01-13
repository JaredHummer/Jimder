export interface Account {
  id: number;
  username: string;
  password: string;
  picture_url: string;
  categories: Category[];
}
