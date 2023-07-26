import { Injectable } from "@angular/core";
import Talk from "talkjs";

@Injectable({
  providedIn: "root",
})
export class TalkService {
  // Déclare une propriété privée qui stockera l'utilisateur actuel de TalkJS.
  private currentUser!: Talk.User;
  private otherApplicationUser!: Talk.User;

  // Définit un objet représentant les informations du support client à des fins de démonstration.
  private user_support = {
    id: "100",
    name: "Alice support",
    email: "support@example.com",
    photoUrl: "../assets/avatar_ycyw.png",
    welcomeMessage: "Hey, how can I help?",
    role: "support",
  };

  // Définit un objet représentant les informations d'un client à des fins de démonstration.
  private user_client = {
    id: "101",
    name: "Mario",
    email: "Client@openclassrooms.com",
    photoUrl: "../assets/avatar_oc.png",
    welcomeMessage: "Hey there! How are you? :-)",
    role: "default",
  };

  // Méthode pour créer un nouvel utilisateur TalkJS
  async createUser(applicationUser: Talk.User) {
    await Talk.ready;
    return new Talk.User({
      id: applicationUser.id,
      name: applicationUser.name,
      photoUrl: applicationUser.photoUrl,
      configuration: "demo_default",
      role: applicationUser.role,
    });
  }

  // Méthode pour créer une session TalkJS avec l'utilisateur actuel
  // le booléen 'support' définit le type d'utilisateur : vrai = support client; faux = client
  async createCurrentSession(isSupport: boolean) {
    await Talk.ready;
    console.log(isSupport);
    if (isSupport) {
      // Crée un utilisateur TalkJS de type support en utilisant l'objet représentant les infos du support.
      this.currentUser = await this.createUser(this.user_support);
      // Initiliase l'autre utilisateur qui sera lié à la conversation, ici de type client
      this.otherApplicationUser = this.user_client;
    } else {
      // Crée un utilisateur TalkJS de type Client en utilisant l'objet représentant les infos du Client
      this.currentUser = await this.createUser(this.user_client);
      // Initiliase l'autre utilisateur qui sera lié à la conversation, ici de type support
      this.otherApplicationUser = this.user_support;
    }

    // Crée une nouvelle session TalkJS avec l'ID d'application spécifié et l'utilisateur actuel.
    // l'ID sera à remplacer... un ID de démo est utilisé
    const session = new Talk.Session({
      appId: "tz6zaHZs",
      me: this.currentUser,
    });
    // Renvoie la session nouvellement créée.
    return session;
  }

  // Méthode privée pour obtenir ou créer une conversation entre l'utilisateur actuel et un autre utilisateur
  private async getOrCreateConversation(
    session: Talk.Session,
    otherApplicationUser: any
  ) {
    // Crée un nouvel utilisateur TalkJS en utilisant les informations de l'autre utilisateur.
    const otherUser = await this.createUser(otherApplicationUser);

    // Récupère ou crée une conversation entre l'utilisateur actuel et l'autre utilisateur.
    const conversation = session.getOrCreateConversation(
      Talk.oneOnOneId(this.currentUser, otherUser)
    );

    // Ajoute l'utilisateur actuel et l'autre utilisateur en tant que participants à la conversation.
    conversation.setParticipant(this.currentUser);
    conversation.setParticipant(otherUser);

    // Renvoie la conversation nouvellement créée ou récupérée.
    return conversation;
  }

  // Méthode pour créer une boîte de réception TalkJS avec une conversation spécifiée.
  async createInbox(session: Talk.Session) {
    // Obtient ou crée une conversation entre l'utilisateur actuel et l'autre utilisateur.
    const conversation = await this.getOrCreateConversation(
      session,
      this.otherApplicationUser
    );

    // Crée une boîte de réception TalkJS et sélectionne la conversation créée précédemment.
    const inbox = session.createInbox();
    inbox.select(conversation);

    // Renvoie la boîte de réception nouvellement créée.
    return inbox;
  }
}
