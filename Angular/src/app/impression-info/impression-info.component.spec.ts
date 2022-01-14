import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ImpressionInfoComponent } from './impression-info.component';

describe('ImpressionInfoComponent', () => {
  let component: ImpressionInfoComponent;
  let fixture: ComponentFixture<ImpressionInfoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ImpressionInfoComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ImpressionInfoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
