import { Component, OnInit, ViewChild, ElementRef } from "@angular/core";
import { ActivatedRoute } from "@angular/router";
import { TalkService } from "src/app/services/talk.service";
import Talk from "talkjs";

@Component({
  selector: "app-chat",
  templateUrl: "./chat.component.html",
  styleUrls: ["./chat.component.scss"],
})
export class ChatComponent implements OnInit {
  title = "Your Car Your Way - Chat";
  private inbox!: Talk.Inbox;
  private session!: Talk.Session;
  private isSupport = false;

  @ViewChild("talkjsContainer") talkjsContainer!: ElementRef;

  constructor(
    private talkService: TalkService,
    private route: ActivatedRoute
  ) {}
  ngOnInit() {
    // récupération du paramètre qui nous permet de définir le type d'accès
    // 0 = client ; 1 = support
    const param = this.route.snapshot.paramMap.get("id")!;
    if (param !== null) {
      this.isSupport = param === "1";
    }

    this.createInbox();
  }

  private async createInbox() {
    // initilisation de talkService et passage du paramètre isSupport pour spécifier le type d'accès
    const session = await this.talkService.createCurrentSession(this.isSupport);
    this.inbox = await this.talkService.createInbox(session);
    this.inbox.mount(this.talkjsContainer.nativeElement);
  }
}
